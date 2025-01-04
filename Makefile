REPO_NAME = repo
CHARTS_DIR = charts
HELM_REPO_URL = https://dblokhin.github.io/helms/$(REPO_NAME)

all: package index

lint:
	helm lint $(CHARTS_DIR)/*

package:
	helm package $(CHARTS_DIR)/* --destination $(REPO_NAME)

index:
	helm repo index $(REPO_NAME) --url $(HELM_REPO_URL) --merge $(REPO_NAME)/index.yaml

clean:
	rm -rf $(REPO_NAME)/*.tgz $(REPO_NAME)/index.yaml

.PHONY: all lint package index clean