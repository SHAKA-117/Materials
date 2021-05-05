import tkinter

datos=[]

def Guardar():
    getip = ip.get()
    getpuerto = puerto.get()
    datos.append(getip+"$"+getpuerto)
    Escribirdatos()
    datos.clear()

def Escribirdatos():
    archivolunes=open("config.txt","w")
    datos.sort()
    for elemento in datos:
        archivolunes.write(elemento)
    archivolunes.close()

def IniciarArchivo():
    archivo=open("config.txt","a")
    archivo.close()

def Cargar():
    archivolunes=open("config.txt","r")
    linea=archivolunes.readline()
    if linea:
        while linea:
            if linea[-1]=='\n':
                    linea=linea[:-1]
            datos.append(linea)
            linea=archivolunes.readline()
        archivolunes.close()

def Consultar():
    Cargar()
    for elemento in datos:
        arreglo=elemento.split("$")
        ip.set(arreglo[0])
        puerto.set(arreglo[1])
    datos.clear()

colorletra = "#FFF"
fontitulo = "Helvetica", 14, "bold"
fontlabel = "Helvetica", 12, "bold"

configuration = tkinter.Tk()
configuration.title("Configuracion")
configuration.geometry("320x135")
IniciarArchivo()
ip=tkinter.StringVar()
puerto=tkinter.StringVar()
Consultar()
labeltitulo = tkinter.Label(configuration,text="Configurarcion de Red",font=(fontitulo))
labeltitulo.place(x=60,y=10)
labelip = tkinter.Label(configuration,text="Direccion IP:",font=(fontlabel))
labelip.place(x=10,y=40)
entryip = tkinter.Entry(configuration,font=(fontlabel),textvariable=ip)
entryip.place(x=120,y=40)
labelport =tkinter.Label(configuration,text="Puerto:",font=(fontlabel))
labelport.place(x=10,y=70)
entryport = tkinter.Entry(configuration,font=(fontlabel),textvariable=puerto)
entryport.place(x=80,y=70)
btguardar = tkinter.Button(configuration,text="Guardar",command=Guardar)
btguardar.place(x=50,y=100)
btsalir = tkinter.Button(configuration,text="Salir",command=configuration.destroy)
btsalir.place(x=210,y=100)
configuration.mainloop()