import socket
import sys
import tkinter
from threading import Thread
from tkinter import messagebox

user=[]
datos1=[]
datos2=[]

def Enviar(event=None):
    nikcs = enk.get()
    if nikcs == "":
        messagebox.showinfo(None,"No ha insertado su nik")
    else:
        dato = msg.get()
        mensajefinal = user[0]+": "+dato
        msg.set("") 
        sock.send(bytes(mensajefinal, "utf8"))
        mensaje_list.insert(tkinter.END, mensajefinal)

def receive():
    while True:
        try:
            res = sock.recv(1024)
            mensaje_list.insert(tkinter.END, res)
        except OSError:
            break

def Insertar():
    nikcs = enk.get()
    user.append(nikcs)
    tnick.configure(state="disabled")
    botoninsert.configure(state="disabled")

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

colorfondo = "#610ba4"
colorletra = "#FFF"
fontitulo = "Helvetica", 14, "bold"
fontlabel = "Helvetica", 12, "bold"
ventana = tkinter.Tk()
ventana.title("Shipping")
ventana.geometry("320x460")
Consultar()
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

server_address = (str(datos2[0]),int(datos2[1]))

try:
    sock.connect(server_address)
except socket.error as e:
    print(str(e))

reciveds = sock.recv(1024)

menssages_frame = tkinter.Frame(ventana)
msg = tkinter.StringVar()
enk =tkinter.StringVar()
msg.set("")
scrollbar = tkinter.Scrollbar(menssages_frame)

mensaje_list = tkinter.Listbox(menssages_frame,height=20, width=40, font=(fontlabel),yscrollcommand=scrollbar.set)
scrollbar.pack(side=tkinter.RIGHT, fill=tkinter.Y)
mensaje_list.pack(side=tkinter.LEFT, fill=tkinter.BOTH)
mensaje_list.pack()
menssages_frame.pack()

mensaje = tkinter.Entry(ventana,font=(fontlabel),textvariable=msg)
mensaje.bind("<Return>", Enviar)
mensaje.place(x=55,y=370)

lmsg = tkinter.Label(ventana,font=(fontlabel), text="MSG:")
lmsg.place(x=10, y=375)

botonmsg = tkinter.Button(ventana,text="Enviar",fg="green",command=Enviar)
botonmsg.place(x=250,y=365)

botoninsert = tkinter.Button(ventana,text="Insertar",command=Insertar)
botoninsert.place(x=250,y=395)

lnick = tkinter.Label(ventana,font=(fontlabel), text="Nick:")
lnick.place(x=10, y=395)

tnick = tkinter.Entry(ventana,font=(fontlabel),textvariable=enk)
tnick.place(x=55, y=395)

botonsalir = tkinter.Button(ventana, text="Salir",command=ventana.destroy)
botonsalir.place (x=100, y=420)

receive_thread = Thread(target=receive)
receive_thread.start()
tkinter.mainloop()
