for dir in */; do
  clean_name=$(echo "${dir%/}" | tr '[:upper:]' '[:lower:]' | tr '_' '-' )

  echo "Processing $dir → $clean_name"

  cd "$dir"

  rm -rf .git

  git init
  git add .
  git commit -m "initial commit"
  git branch -M main

  git remote add origin https://github.com/Quantamofsolace/$clean_name.git
  
  git push -u origin main

  cd ..
done
