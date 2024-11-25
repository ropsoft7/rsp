# Definindo variáveis de proxy
export http_proxy="http://127.0.0.1:8118" 
export https_proxy="http://127.0.0.1:8118" 
export ftp_proxy="http://127.0.0.1:8118"   
export socks_proxy="socks5://127.0.0.1:8118"

# Se você estiver usando o Privoxy, você pode adicionar também
export HTTP_PROXY="http://127.0.0.1:8118"
export HTTPS_PROXY="http://127.0.0.1:8118"
export FTP_PROXY="http://127.0.0.1:8118"
export SOCKS_PROXY="socks5://127.0.0.1:8118"

# Configuração para não usar o proxy para certas URLs
export no_proxy="localhost,127.0.0.1,.example.com"
