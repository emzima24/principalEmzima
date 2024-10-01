#./pasos.sh nombre_directorio para su ejecucion
# chmod +x nombre_archivo.sh para otorgar permisos desde git bash
# el directorio depende donde este la carpeta asociada al repo
# en este caso esta una instancia antes

dir=$1
cd $dir

n_main="main"
n_dev="develop"
n_index="index"
n_about="about"
n_conc="contact"
n_assets="assets"

# Eliminar en el repositorio local
git branch -D $n_assets
git branch -D $n_conc
git branch -D $n_about
git branch -D $n_index

# Eliminar en el repositorio remoto
git push origin --delete $n_assets
git push origin --delete $n_conc
git push origin --delete $n_about
git push origin --delete $n_index


