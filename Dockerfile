FROM continuumio/miniconda3

# Create the environment:
COPY environment.yml .
RUN conda env create -n xMoonJelly_fw --file environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "xMoonJelly_fw", "/bin/bash", "-c"]