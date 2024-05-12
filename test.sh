#!/bin/bash

# Check if three file names are provided

# Process each file
for file in "$@"; do
    echo "Processing file: $file"

    echo "----------------------------------------"


    # column_number=$(awk -F '\t' '{ for (i=1; i<=NF; i++) if ($i == "Continent") {print i} }' "$file")

    # result=$(awk -F'\t' '$2 != "" { print }' "$file")

    # if [ "$column_number" ]; then

    #     awk -F '\t' -v col="$column_number" 'BEGIN {FS = "\t"; OFS = "\t"} {$col = ""; sub("\t\t","\t") } 1' <<< "$result" > "${file%.tsv}_processed.tsv"
    
    # else

    #     echo "$result" > "${file%.tsv}_processed.tsv"

    # fi


    awk -F'\t' 'NR == 1 || ($3 >= 2011 && $3 <= 2021)' "$file" > "${file%.tsv}_processed.tsv"

done



#     echo ""

    # # 获取文件的第一行
    # first_line=$(head -n 1 "$file")

    # # 检查第一行是否包含制表符
    # if [[ "$first_line" =~ $'\t' ]]; then
    #     echo "File $file is already tab-separated."
    #     echo ""
    # else
    #     # 使用 awk 将文件转换为制表符分隔格式
    #     awk 'BEGIN { FS="\t"; OFS="\t" } { print }' "$file" > "${file}.tmp"
    #     mv "${file}.tmp" "$file"
    #     echo "File $file has been converted to tab-separated format."
    #     echo ""
    # fi

#     # 获取标题行的单元格数量
#     num_cells=$(head -n 1 "$file" | awk -F'\t' '{print NF}')

#     echo "Number of cells in the header: $num_cells"
#     echo ""

#     # 检查文件中的每一行是否具有相同的单元格数量
#     awk -F'\t' -v num_cells="$num_cells" '{
#         if (NF != num_cells) {
#             print "Line " NR " has a different number of cells."
#         }
#     }' "$file"


# done


# join -t $'\t' -1 1 -2 1 -a 1 -a 2 -a 3 -e '' file1 file2 file3 > output.tsv

