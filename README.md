The python_setup.sh is a setup script for installing a Python3 delevoper environment on a CentOS 7 host, e.g. an Amazon t2.micro EC2 using ami-0f2b4fc905b0bd1f1

To setup the python environment, follow these 5 steps:
1. Create a CloudFormation stack using the ./cloudformationtemplate.yml file in this repo.
    
2. ssh into the new EC2 using command like this...
    ssh -i "BrkTrialAws.pem" centos@ec2-3-17-162-158.us-east-2.compute.amazonaws.com
    ...but look up the public DNS name for the launched EC2 and substitute it for the one in the example above
3. Open another terminal and scp ./python_setup.sh into /home/centos/ like so...
    scp -i "~/.ssh/BrkTrialAws.pem"  ~/code/python/python_setup_for_centos_7/python_setup.sh centos@ec2-3-17-162-158.us-east-2.compute.amazonaws.com:/home/centos/
    ...but, again, look up the public DNS name for the launched EC2 and substitute it for the one in the example above
4. Run command...
    bash python_setup.sh
5. If the /home/centos/python/src/ folder wasn't created, and the python_scipts repo not cloned into it (final 8 lines of ./python_setup.sh), run these commands manually.

Save changes to the python_stripts and push the changes back to GitHub.

If something goes wrong, or it's time to terminate the instance, go to CloudFormation and delete the stack.

---------

To setup Go, repeat steps 3 & 4, only for the ./go_setup.sh file.
