Manual de instalación
______________________

1.  Clonar el repositorio•	
•	git clone https://github.com/RelatifVision/PrimeVideo_PostgreSQLgit
•	cd <<ruta/tu/repositorio>>


2.  Instalar Docker
   
3.  Creamos y activamos Entorno Virtual
•	Crear Entorno Virtual
•	python -m venv env
•	  Activar entorno Virtual
•	env\Scripts\activate.# CMD
•	source env/bin/actívate # macOS/Linux

4.  Instalar las Dependencias
•	Instalar las dependencias listadas en el archivo ‘requirements.txt’
•	pip install -r  requirements.txt

5.  Configurar en el archivo settings.py de tu proyecto, localiza la sección DATABASES y modifícala para usar PostgreSQL

•	DATABASES = {
o	‘default’: {
	‘ENGINE’: ‘django.db.backends.postgresql’,
	‘NAME’: ‘PrimeVideo’,
	‘USER’: ‘admin
	‘PASSWORD’: ‘admin’,
	‘HOST’: ‘localhost’, 
	‘PORT’: ‘5432’
}
}

6.	Ejecutar Docker
•	 Levantar PostgreSQL en el CMD
docker  run --rm --name some-postgres -e POSTGRES_PASSWORD=admin -e POSTGRES_USER=admin -e POSTGRES_DB=PrimeVideo -p 5432:5432  -d postgres:17.2-alpine

7. Aplicar Migraciones (Terminal)
•	python manage.py makemigration
•	python manage.py migrate

8. Cargar datos y guardar modificaciones:
•	Importar base de datos
•	python manage.py loaddata .\data_backup.json
•	Actualizar modificaciones
•	python manage.py loaddata .\data_backup.json

9. Admin y usuarios:
•	Si no, tienes estos user puedes registrarte o usar estis pass que son admin:
o	admin    4dM1Ni57r@D0
o	javi95   2295

•	Y los usuarios ya creados con su pass:
o	joe3  joe3
o	12341234

10.  Ejecutar el Servidor de Desarrollo:
•	Inicia el servidor de desarrollo para verificar que todo funcione correctamente.
•	python manage.py runserver (terminal)

12.  Cerrar o parar el server del database
•	Inicia el servidor de desarrollo para verificar que todo funcione correctamente.
•	docker stop some-postgres

PD: es una prueba la página Home de momento es una imagen fija pero acabará previsualizandose como el resto con ese tipo de miniaturas
