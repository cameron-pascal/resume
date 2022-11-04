FROM lscr.io/linuxserver/libreoffice:latest 

# Aquire ghostscript (needed for font embedding).
RUN apk add --no-cache ghostscript

# Aquire unzip to decompress the Hack font.
RUN apk add unzip

# Aquire the Hack font and decompress.
RUN curl -LO https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
RUN unzip Hack-v3.003-ttf.zip

# Install Hack into the container's fonts.
RUN mv ttf/* /usr/share/fonts && fc-cache -fv

COPY generate_pdf.sh /home/generate_pdf.sh
RUN chmod +x /home/generate_pdf.sh

RUN mkdir /input
RUN mkdir /output
