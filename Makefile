export MAVEN_METADATA_URL = maven.sequenceiq.com/releases/com/sequenceiq/cloudbreak-shell/maven-metadata.xml
export DOCKER_IMAGE = sequenceiq/cb-shell

dockerhub:
	./deploy.sh

.PHONY: dockerhub
