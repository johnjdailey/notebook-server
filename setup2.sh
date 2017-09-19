mkdir certificate
conda create --name kaggle_env python=3
conda install --name kaggle_env numpy seaborn scipy scikit-learn keras tensorflow
conda update conda
conda update anaconda
jupyter notebook --generate-config
jupyter notebook password
openssl req -x509 -nodes -days 3650 -newkey rsa:1024 -keyout ./certificate/mykey.key -out ./certificate/mycert.pem 
echo "c.NotebookApp.certfile = u'/home/$USER/certificate/mycert.pem'" >> ./.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.keyfile = u'/home/$USER/certificate/mykey.key'" >> ./.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'" >> ./.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ./.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8890" >> ./.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password_required = True" >> ./.jupyter/jupyter_notebook_config.py
pwd=$(cat ./.jupyter/jupyter_notebook_config.json | sed -n -e 's/^.*"password": //p' | sed 's/[^"]*"\([^"]*\)".*/\1/')
echo "c.NotebookApp.password = u'$pwd'" >> ./.jupyter/jupyter_notebook_config.py