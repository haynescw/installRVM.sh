printf "\n<<<<<<<<<<<<<<< Installing sqlite >>>>>>>>>>>>>>>\n"
brew install sqlite
wait  
printf "\n<<<<<<<<<<<<<<< Installing mysql >>>>>>>>>>>>>>>\n"
brew install mysql
wait  
printf "\n<<<<<<<<<<<<<<< Installing free-tds >>>>>>>>>>>>>>>\n"
brew install freetds
wait  
printf "\n<<<<<<<<<<<<<<< Installing openssl >>>>>>>>>>>>>>>\n"
brew install openssl
wait
printf "\n<<<<<<<<<<<<<<< Installing RVM most recent Stable version >>>>>>>>>>>>>>>\n"
curl -L https://get.rvm.io | bash -s stable
wait
printf "\n<<<<<<<<<<<<<<< Adding lines to you bash profile to source RVM >>>>>>>>>>>>>>>\n"
echo '# For RVM install' >> $HOME/.bash_profile
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> $HOME/.bash_profile
echo '. ~/.bashrc' >> $HOME/.bash_profile
wait
printf "\n<<<<<<<<<<<<<<< Loading RVM inta session >>>>>>>>>>>>>>>\n"

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi
wait 
source $HOME/.bash_profile
wait
printf "\n<<<<<<<<<<<<<<< Verifying rvm is a function >>>>>>>>>>>>>>>\n"
type rvm | head -n1
wait
printf "\n<<<<<<<<<<<<<<< Installing latest stable Ruby 1.8.7 >>>>>>>>>>>>>>>\n"
rvm install 1.8.7-p374
wait
printf "\n<<<<<<<<<<<<<<< Checking the RVM System >>>>>>>>>>>>>>>\n"
rvm system
wait
printf "\n<<<<<<<<<<<<<<<Setting RVM default as 1.8.7>>>>>>>>>>>>>>>\n"
rvm use 1.8.7-p374 --default
wait
printf "\n<<<<<<<<<<<<<<< Verifying Which Ruby >>>>>>>>>>>>>>>\n"
which ruby
wait
printf "\n<<<<<<<<<<<<<<< Creating .gemrc to suppress ri and rdoc >>>>>>>>>>>>>>>\n"
touch ~/.gemrc
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc


printf "\n######################################################################\n"
printf "     You are now ready to program in Ruby on Rails. Have Fun. I am.   \n"
printf "######################################################################\n"


printf "____________________________________________________________________\n"
printf "Enjoy my hard work and boredom in creating this script, Chris Haynes\n\n"
printf " ****** P.S. Keep your eye on Teske, and dont talk to him about Guns, Trust me ******\n\n\n"
