This docker image helps you to start `cloudbreak-shell`. Previously the shell
was part of the Cloudbreak docker image, but they have a separate lifecycle,
so it deserves it’s very own Dockerfile. Here it comes ...

## Usage

To connect to the hosted Cloudbreak server, you only need your
account **email** and **password**
```
docker run -e SEQUENCEIQ_USER=myuser@example.com -e SEQUENCEIQ_PASSWORD=secret123 -it sequenceiq/cb-shell
```

## Keep passwords secret

Its not a good practice to type your password in a command line. Instead:
```
 -e SEQUENCEIQ_PASSWORD=secret123
```

You would set t in your `.profile` or `.bash_profile`
```
export SEQUENCEIQ_PASSWORD=secret123
```

At docker start you will pass it as:
```
   -e SEQUENCEIQ_PASSWORD=$SEQUENCEIQ_PASSWORD
```

## Custom cloudbreak server

By default, if you don’t specify the default url’s will be used:

- `CLOUDBREAK_ADDRESS` https://cloudbreak-api.sequenceiq.com/
- `IDENTITY_ADDRESS` https://identity.sequenceiq.com

If you want to connect to your own cloudbreak deployment:

```
docker run -it \
  -e CLOUDBREAK_ADDRESS=https://cloudbreak.example.com \
  -e IDENTITY_ADDRESS=https://identity.example.com \
  -e SEQUENCEIQ_USER=myuser@example.com \
  -e SEQUENCEIQ_PASSWORD=secret123 sequenceiq/cb-shell
```

## Custom jar

If you want to use a custom Cloudbreak shell artifact (e.g. another version), all you need is to specify it via
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
