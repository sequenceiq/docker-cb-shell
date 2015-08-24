This docker image helps you to start `cloudbreak-shell`. Previously the shell
was part of the Cloudbreak docker image, but they have a separate lifecycle,
so it deserves it’s very own Dockerfile. Here it comes ...

## Usage

To connect to the hosted Cloudbreak server, you only need your
account **email** and **password**
```
docker run -e SEQUENCEIQ_USER=myuser@example.com -e SEQUENCEIQ_PASSWORD=secret123 -it sequenceiq/cb-shell:0.5.10
```

## Keep passwords secret

Its not a good practice to type your password in a command line. Instead of passing the plain text password as:
```
 -e SEQUENCEIQ_PASSWORD=secret123
```

You can set it in your `.profile` or `.bash_profile`
```
export SEQUENCEIQ_PASSWORD=secret123
```

At Docker start you will pass it as:
```
   -e SEQUENCEIQ_PASSWORD=$SEQUENCEIQ_PASSWORD
```

## Custom Cloudbreak server

By default, if you don’t specify, the default url’s will be use/connect to:

- `CLOUDBREAK_ADDRESS` https://cloudbreak-api.sequenceiq.com/
- `IDENTITY_ADDRESS` https://identity.sequenceiq.com

If you want to connect to your own Cloudbreak deployment:

```
docker run -it \
  -e CLOUDBREAK_ADDRESS=https://cloudbreak-api.example.com \
  -e IDENTITY_ADDRESS=https://identity.example.com \
  -e SEQUENCEIQ_USER=myuser@example.com \
  -e SEQUENCEIQ_PASSWORD=secret123 sequenceiq/cb-shell:0.5.10
```

If you want to connect to Cloudbreak deployment setup with [cloudbreak-deployer](https://github.com/sequenceiq/cloudbreak-deployer)

```
docker run -it \
  -e CLOUDBREAK_ADDRESS=http://172.17.42.1:8080 \
  -e IDENTITY_ADDRESS=https://172.17.42.1:8089 \
  -e SEQUENCEIQ_USER=admin@example.com \
  -e SEQUENCEIQ_PASSWORD=cloudbreak sequenceiq/cb-shell:0.5.10
```
With a cloudbreak-deployer setup, you can also use this command to get Cloudbreak shell (recommended)

```
cbd util cloudbreak-shell
```

## Custom jar

If you want to use a custom Cloudbreak shell artifact (e.g. another version), all you need is to specify it via
the `CLOUDBREAK_CUSTOM_JAR_URL=` env variable:

```
docker run -it \
  -e CLOUDBREAK_CUSTOM_JAR_URL=https://example.com/custom-cb-shell.jar \
  sequenceiq/cb-shell:0.5.10 myuser@example.com secret123
```

## Troubleshooting

If you want to see more output, set the `TRACE` and variable to anything:
```
docker run -e TRACE=1 ...
```
