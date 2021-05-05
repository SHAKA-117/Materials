import socket
import sys
from _thread import *

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
datos1=[]
datos2=[]

def NewClient(connection):
    connection.send(str.encode('Server is working:'))
    while True:
        data = connection.recv(1024)
        if data:
            broadcast(data,connection)
        else:
            remove(connection) 
            break

def broadcast(message, connection):
    for clients in list_client: 
        if clients!=connection: 
            try: 
                clients.send(message) 
            except: 
                clients.close()  

def remove(connection): 
    if connection in list_client: 
        list_client.remove(connection) 

def Cargar():
    archivolunes=open("config.txt","r")
    linea=archivolunes.readline()
    if linea:
        while linea:
            if linea[-1]=='\n':
                    linea=linea[:-1]
            datos1.append(linea)
            linea=archivolunes.readline()
        archivolunes.close()

def Consultar():
    Cargar()
    for elemento in datos1:
        arreglo=elemento.split("$")
        datos2.append(arreglo[0])
        datos2.append(arreglo[1])
    datos1.clear()

Consultar()

try:
    server_address = (str(datos2[0]),int(datos2[1]))
    sock.bind(server_address)
except socket.error as e:
    print(str(e))

sock.listen(5)
list_client = []

while True:
    connection,client_address = sock.accept()
    list_client.append(connection)
    start_new_thread(NewClient, (connection, ))    
connection.close()
