## Install Helm

1. https://helm.sh/docs/intro/install/
2. Check that it's installed.
```
helm version
```

## Create A Helm Chart
1. Create a Helm Chart with the following command
```
helm create mychart
```

## Install Helm Chart
1. `cd` into the `mychart` directory.

2. Install the Helm Chart that's in your current directory and give it a name called `nginxapp`
```
helm install nginxapp .
```