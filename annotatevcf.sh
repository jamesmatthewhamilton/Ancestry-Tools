ids=$1
in=$2
out=$3
if [ -z $4 ]; then
    threads=1
else
    threads=${4}
fi

for i in ./${in}/*.vcf; do
    echo "(!) Converting File: $i"
    filename="${i%.*}"
    filename=$(basename $filename)
    echo "(!) Filename: $i"
    SnpSift annotate -v -Xmx32G ${ids} ${i} > ./${out}/${filename}.vcf
done

