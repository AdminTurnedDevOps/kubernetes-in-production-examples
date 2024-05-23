Run the following code.
Make sure you type `Y` at all prompts

### Create domain
```
mkdir guestbook
cd guestbook
kubebuilder init --domain my.domain --repo my.domain/guestbook
```

### Build an Operator
```
kubebuilder create api --group webapp --version v1 --kind Guestbook
```

### Make and Run Manifests
```
make manifests
```

```
make install
```

```
make run
```

### Deploy Manifests
```
kubectl apply -k config/samples/
```

### Cleanup
```
make uninstall
```

```
make undeploy
```