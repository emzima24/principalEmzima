#./pasos.sh nombre_directorio para su ejecucion
# no incluye los pull request
# git clone link_html
# chmod +x nombre_archivo.sh para otorgar permisos desde git bash


dir=$1
cd $dir

n_main="main"
n_dev="develop"
n_index="index"
n_about="about"
n_conc="contact"
n_assets="assets"

git checkout -b $n_main
git checkout -b $n_dev

git add readme.md
git commit -m "readme"
git push origin $n_dev

git checkout -b $n_index

git add index.html
git commit -m "${n_index} page"
git push origin $n_index

git checkout $n_dev
git checkout -b $n_about

git add about.html
git commit -m "${n_about} page"
git push origin $n_about

git checkout $n_dev
git checkout -b $n_conc

git add contact.html
git commit -m "${n_conc} page"
git push origin $n_conc

git checkout $n_dev
git checkout -b $n_assets

git add files styles
git commit -m "${n_assets} files and styles"
git push origin $n_assets