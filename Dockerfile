FROM horovod/horovod:0.15.2-tf1.12.0-torch1.0.0-py3.5

# Install zsh
RUN apt-get update && apt-get -y install curl zsh git 
RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ||true
RUN chsh -s /bin/zsh