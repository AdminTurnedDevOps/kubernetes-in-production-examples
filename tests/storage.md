1. List out the Storage Classes available.
2. Make note of the name of a SC that's RWO
3. Create a PVC that contains the SC name and 10gi of storage
4. Create a new Pod Manifest that contains:
- use of an nginx latest image
- over port 80
- Use the PVC that was created in the third step