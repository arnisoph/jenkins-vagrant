export environment={env_puppet}

export project={project_app}
export context=/
export test_url=/test

export PERL5LIB=$(pwd)/lib:$PERL5LIB

echo -e "\n=========================== the environment ============================\n"
env
echo -e "\n========================================================================\n"

cd mygitrepo/
rex -Fc rollout

echo "=== $? ==="
