function hexhead()
{

# This bash function will add the byte offset to the header similar to emacs hexl-mode. However two benefits for me
# First automatically read-only viewing. Second can pass in $(tail|head -c +(integer)) easier

local -r counted=49
numargs=$#

for ((i=1 ; i <= numargs ; i++))

do
    echo -e "7654321: 0011 2233 4455 6677 8899 AABB CCDD EEFF\n"
    
    # Use the power of zero-width and printf to make a divider header. One of many options
    printf '%.0s-' $(seq $counted)
    
    # This will call regular xxd for bash paramater. Though, Im thinking I should change this to '"$*"'
    # because I often pass xxd specific options to xxd and thusly the shift and for-loop properties need to be refactored
    xxd $1 
    shift 
done

}
