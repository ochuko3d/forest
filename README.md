This project consist of the following,
  1. The python script called tree.py. It launches an application that poins to my favorite tree if verything goes well
  2. The pytest file called test_tree.py. The name of the file has to be called test_* if not pytest, will not start/look for it automatically
  3. The Deployment files with consist of the pod deployments from the image built from the dockerfile and then the service yaml equally to register the pods to the http port.
  4. The Dockerfile which build the application and saves it on the local repository
  5. The build script which runs evertyhing from the dockerfile build to add the url to the /etc/hosts file
  
