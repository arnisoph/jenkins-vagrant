===============
jenkins-vagrant
===============

.. image:: http://img.shields.io/github/tag/bechtoldt/jenkins-vagrant.svg
    :target: https://github.com/bechtoldt/jenkins-vagrant/tags

.. image:: http://issuestats.com/github/bechtoldt/jenkins-vagrant/badge/issue
    :target: http://issuestats.com/github/bechtoldt/jenkins-vagrant

.. image:: https://api.flattr.com/button/flattr-badge-large.png
    :target: https://flattr.com/submit/auto?user_id=bechtoldt&url=https%3A%2F%2Fgithub.com%2Fbechtoldt%2Fjenkins-vagrant

A Vagrant VM that uses SaltStack to setup a Tomcat/ Jenkins instance

.. contents::
    :backlinks: none
    :local:


Requirements
------------

You need:

* basic vagrant knowledge (RFTM skills are sufficient)
* Vagrant >= 1.6.5 (``$ vagrant -v``)


Workflows
---------
Testing Jenkins Job Builder
'''''''''''''''''''''''''''

::

    $ git clone git@github.com:bechtoldt/jenkins-vagrant.git --recursive
    $ cd jenkins-vagrant/
    $ wget http://jenkins.mirror.isppower.de/war/1.606/jenkins.war -O share/misc/jenkins.war
    $ wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz -O share/misc/apache-tomcat-8.0.20.tar.gz
    $ wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz -O share/misc/jdk-8u40-linux-x64.tar.gz
    $ cp ~/Documents/dev/github/vagrant-devenv/shared/boxes/DEV_Debian_78_salt_arbe_git-virtualbox-CURRENT.box share/

    $ cp nodes.yaml.dist nodes.yaml
    $ cd vagrant/
    $ vagrant up
    $ vagrant ssh
    $ sudo -i
    # salt-call test.version
    # salt-call -l debug state.sls repos,users,git,tools,sysctl,java,tomcat test=False

Go to ``http://10.10.11.100:18080/jenkins/`` enable security, add a local user test:test.

::

    # git clone https://git.openstack.org/openstack-infra/jenkins-job-builder
    # cd jenkins-job-builder/
    # python setup.py install
    # pip install pbr
    # cd /vagrant/share/misc/jenkins_job_builder/
    # jenkins-jobs --conf=config.ini update myproject/


Additional resources
--------------------

Please see https://github.com/bechtoldt/vagrant-devenv for some more bits of information about the vagrant VM. You can use it to build the Vagrant box mention above (``DEV_Debian_78_salt_arbe_git-virtualbox-CURRENT.box``), too.


.. image:: https://asciinema.org/a/18107.png
    :target: https://asciinema.org/a/18107


TODO
----

None
