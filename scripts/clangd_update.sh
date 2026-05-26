file=~/.clangd
echo "CompileFlags:" > $file
echo "  Add:" >> $file
g++ -E -v -xc++ /dev/null 2>&1 | awk '/^ \/nix\/store/ {print $0}' | awk '{gsub(/[ \t]+/, ""); print}' | awk 'NR==2, NR==8 {print "    - -I"$0}' >> $file
echo "    - -DLOCAL" >> $file
echo "    - -Wall" >> $file
echo "    - -O2" >> $file
echo "    - -Wextra" >> $file
echo "    - -Wshadow" >> $file
echo "    - -Wconversion" >> $file
echo "    - -Wfloat-equal" >> $file
echo "    - -Wno-unused-const-variable" >> $file
echo "    - -Wno-sign-conversion" >> $file
echo "#    - -std=c++17" >> $file
