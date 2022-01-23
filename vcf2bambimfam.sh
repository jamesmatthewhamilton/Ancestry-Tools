in=$1
out=$2
if [ -z $3 ]; then
    threads=1
else
    threads=${3}
fi

for i in ./${in}/*.vcf; do
    echo "(!) Converting File: $i"
    filename="${i%.*}"
    filename=$(basename $filename)
    echo "(!) Filename: $i"
    plink --vcf $i --make-bed --out ./${out}/${filename} --threads ${threads}
done

