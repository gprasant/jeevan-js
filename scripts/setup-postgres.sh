echo "Install Postgres"
sudo apt-get install postgresql

echo "setup postgres user"
sudo -u postgres psql postgres

echo "set password (Run this in psql)"
\password postgres  # (Enter password as 'postgres')

echo "Create database jeevan"
sudo -u postgres createdb jeevan