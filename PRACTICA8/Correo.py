import os
import smtplib
import ssl

from email import encoders
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


# Listas

correos = []


def Msg():
    Mensaje = input("Ingresa el mensaje que deceas mandar: ")
    Asunto = input("Ingresa el asunto del mensaje: ")
    Mensaje = "Subject: {}\n\n{}".format(Asunto, Mensaje)

    # Esta funcion retorna el mensaje que se enviara al cliente y el Asundo
    return Mensaje


# Esta funcion es para el mensaje   que se mandara con HTML
def Msg_HTML():
    Mensaje = input("Ingresa el mensaje que deceas mandar: ")
    Asunto = input("Ingresa el asunto del mensaje: ")
    Mensaje = "Subject: {}\n\n{}".format(Asunto, Mensaje)

    # Esta funcion retorna el mensaje que se enviara al cliente y el Asundo
    return Mensaje, Asunto


# Recibimos datos del usuario para hacer el login


def DatosGmail():
    correo = input("Ingresa tu correo electronico: --> ")
    password = input("Ingresa tu contraseña: --> ")
    return correo, password


def Iservidor_Login(correo, password):
    server = smtplib.SMTP(
        "smtp.gmail.com",
    )

    server.starttls()

    server.login(correo, password)

    return server



def CorreoCliente():
    usuario = input(
        "Ingresa el correo del cliente en el \
        siguiente formato --> "
        + ("(Ejemplo@gmail.com): ")
    )

    return usuario


def EnviarMSG(usuario, Mensaje, server, correo):
    server.sendmail(correo, usuario, Mensaje)
    op = input("Deseas mandarle a otro usuario este correo " + "si/no:")
    while op == "si":
        usuario = ""
        usuario = input(
            "Ingresa el correo del cliente en el \
            siguiente formato --> "
            + ("(Ejemplo@gmail.com): ")
        )
        server.sendmail(correo, usuario, Mensaje)
        op = input("Deseas mandarle a otro usuario este correo " + "si/no: ")
    server.quit()


# Funcion para enviar HTML


def EnviarMSG_HTML(usuario, Mensaje, server, correo, mensaje):
    server.sendmail(correo, usuario, mensaje.as_string())

    server.quit()


def FuncionHTML(Correo, usuario, Asunto):
    # Estandar
    mensaje = MIMEMultipart("Alternative")
    mensaje["Subject"] = Asunto
    mensaje["From"] = correo
    mensaje["To"] = usuario

    html = f"""
     ## Aqui puedes solocar tu mensaje en HTML 
     
    """

    parte_html = MIMEText(html, "html")

    mensaje.attach(parte_html)

    return mensaje


opc = int(
    input(
        "Deseas mandar un mensaje a un solo usuario o a varios [0] Para un solo usuario \
                [1] Para multiples usuarios "
    )
)
if opcion == 0:
    correo, password = DatosGmail()
    server = Iservidor_Login(correo, password)
    Mensaje = Msg()
    usuario = CorreoCliente()
    EnviarMSG(usuario, Mensaje, server, correo)
    print("Correo se envio con exito: ")
elif opc == 1:
    print("fuera de servicio")

    correo, password = DatosGmail()
    server = Iservidor_Login(correo, password)
    Asunto, Mensaje = Msg_HTML()
    usuario = CorreoCliente()
    mensaje = FuncionHTML(usuario, correo, Asunto)
    EnviarMSG_HTML(usuario, Mensaje, server, correo, mensaje)
    print("Correo se envio con exito: ")
else:
    print("opcion no valida intenta de nuevo: :) ")
