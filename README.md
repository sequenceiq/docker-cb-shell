This docker image helps you to start cloudbreak-shell. Previously the shell 
was part of the cloudbreak docker image, but they have a separate lifecycle,
so it deserves it’s very own dockerfile. Here it comes ...

## Usage

To connect to the hosted cloudbreak server, you only need your
account **email** and **password**
```
docker run -it sequenceiq/cb-shell myuser@example.com secret123
```

## Custom jar

If you want to use a custom Cloudbreak deployment, all you need is to specify it via
the `CLOUDBREAK_CUSTOM_JAR_URL=` env variable:

```
docker run -it \
  -e CLOUDBREAK_CUSTOM_JAR_URL=https://example.com/custom-cb-shell.jar \
  sequenceiq/cb-shell myuser@example.com secret123
```

## Troubleshooting

If you want to see more output, set the `TRACE` and variable to anything:
```
docker run -e TRACE=1 ...
```
