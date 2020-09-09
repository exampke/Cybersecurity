#  Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![https://github.com/exampke/Cybersecurity/blob/master/Diagrams/JClow's%20ELK%20stack.jpg](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the docker file may be used to install only certain pieces of it, such as Filebeat.

https://github.com/exampke/Cybersecurity/blob/master/Ansible/elk-playbook.txt

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting unauthorized traffic the network.
- The load balancer receives any traffic that comes into the website and distributes it across multiple servers. This helps distribute traffic evenly among the servers and mitigates DDoS attacks
- A jump box provides an enterprise's admins with a secure computer to connect to before launching any administrative task. Additionally, it can be used, as it is here, as an origination point to connect to other servers or untrusted environments. The Jump-Box provides a highly secured environment that is used solely for administrative tasks.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.

The configuration details of each machine may be found below.

| Name       | Function             | IP Adress | Operating System |   
|------------|----------------------|-----------|------------------|
| Jump-box   | Gateway              | 10.1.0.7  | Linux            |
| Web-1      | DVWA container       | 10.1.0.5  | Linux            |
| Web-2      | DVWA container       | 10.1.0.6  | Linux            |
| ELK-server | ELK server container | 10.0.0.4  | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-box provisioner can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 68.106.25.252

Machines within the network can only be accessed by SSH.
- The Elk VM can be accessed from the Ansible container on the Jump-box-provisioner (40.78.91.188; 10.1.0.7).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes              | 68.106.25.252    |
| Web-1    | No                  | 10.1.0.7 10.1.0.6 10.0.0.4             |
| Web-2    | No                  | 10.1.0.7 10.1.0.5 10.0.0.4             |
| Elk-server| No                 |10.1.0.7                                |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- This approach employs Infrastructure as code (IaC), which allows each component to be individually defined with code. So, from a security standpoint, we can quickly bring a particular piece of infrastructure up and running within a few minutes by running the code that defines the piece of infrastructure. Also, if the infrastructure is  ever compromised, we can destroy it and redeploy a new working version within minutes. As such, we can build in security protocols from the ground up.

The playbook implements the following tasks:
- Installs Docker
- Downloads the required images
- Installs the configurations to the ELK server
- Installs the Filebeat configurations to the DVWA servers

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.1.0.5
- Web-2 10.1.0.6

We have installed the following Beats on these machines:
- filebeat-7.4.0-amd64.deb

These Beats allow us to collect the following information from each machine:
-  Filebeat is used to format log files and has the ability to forward this data elsewhere to be processed and analyzed (such as an ELK server in this scenario). This data will contain information such as event logs to track the activity on the system.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk-playbook.yml file to the /etc/ansible folder.
- Copy the filebeat-config.yml file to the /etc/ansible/files folder. Enusre the IP addresses in this file set to your ELK server public IP and port 5601.
- Copy the filebeat-playbook.yml file to the /etc/ansible/files folder.
- Update the /etc/ansible/hosts file to include a webservers section and an ELK servers section. From here, edit this file to include the IP addresses of the respective VM’s. 
- Run the filebeat-playbook.yml file to install Filebeat on your webservers.
- Run the playbook, and navigate to http://40.88.126.91:5601/app/kibana. to check that the installation worked as expected.
