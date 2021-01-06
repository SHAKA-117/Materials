#!/usr/bin/bash
echo "======Bienvenido======"
echo ""
echo "¿Qué palabra quieres traducir?"
read palabra
echo ""
echo "¿En que idioma quieres traducirlo?"
echo "=============================="
echo "| Ingles:  en                |"
echo "| Español: es                |"
echo "| Aleman:  de                |"
echo "| Japones: ja                |"
echo "| Frances: fr                |"
echo "| Portugues(Brasil): pt-BR   |"
echo "| Ruso:    ru                |"
echo "============================="
read idioma
echo ""
sleep 1;
echo ""
echo "=============================="
trans -shell :$idioma "$palabra"
