for f in bu*.aux; do
  bibtex $f
done
bibtex BeamerPdhThesis.aux