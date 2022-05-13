# Use this horrible hex string, 
# Because "NAME" outputted from man
# is bold and wont match regular regex
boldNameInMan=$(printf '\x4E\x08\x4E\x41\x08\x41\x4D\x08\x4D\x45\x08\x45')

# Get man page, grep for NAME, print next line and remove "NAME" with tail
echo $(man $1 | grep -A1 -e "^${boldNameInMan}.*" | tail -1)