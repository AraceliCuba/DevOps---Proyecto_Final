import os

#Carpeta dataset#
location = "C:/Users/USUARIO/Documents/proyecto_parcial/python/dataset"

#Validar si existe la carpeta#
if not os.path.exists(location): #si no existe#
    #creo carpeta dataset#
    os.mkdir(location)
else: #si existe carpeta#
    #borramos contenido#
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) #eliminar archivo#
        for name in dirs:
            os.rmdir(os.path.join(root,name)) #eliminar carpetas
    
#Descargar dataset"
from kaggle.api.kaggle_api_extended import KaggleApi

#Autenticarnos#
api = KaggleApi()
api.authenticate()

#print(api.dataset_list(search=''))

api.dataset_download_files('berkayalan/paris-2024-olympics-medals', path=location, force=True, quiet=True, unzip=True)