# Starting point for runnable rules for typical redir. Customize to necessity but th

# Definitions
REDIR="REDIR_NUM"
PUB_IP='0.0.0.0'
PRIV_IP='172.0.0.0'
FRIENDLY='10.0.0.0'

# Clobber prompt variable
echo "PS1=\${debian_chroot:+(\$debian_chroot)}\u@\h:\w\ - \${REDIR}\$" >> /root/.bashrc

# Default Policy to Allow. Putting DROP will be painful. Let your last entry handle dropping
iptables -P INPUT ACCEPT

# Typical Allows. Customize for interfaces and ports
iptables -A INPUT -p tcp --dport 443 -j ACCEPT -i eth0
iptables -A INPUT -p tcp --dport 8443 -j ACCEPT -i eth0
iptables -A INPUT -p tcp --dport 80 -j ACCEPT -i eth0
iptables -A INPUT -p tcp --dport 80 -j ACCEPT -i eth1
iptables -A INPUT -p tcp --dport 8443 -j ACCEPT -i eth1
iptables -A INPUT -p tcp --dport 443 -j ACCEPT -i eth1

# rules for opnet vms
iptables -A INPUT -s 172.21.4.4  -p tcp --dport 22 -j ACCEPT -i eth1
iptables -A INPUT -s 10.0.42.10 -p tcp --dport 22 -j ACCEPT -i eth0
iptables -A INPUT -s 172.21.4.6  -p tcp --dport 22 -j ACCEPT -i eth1
iptables -A INPUT -s 10.0.42.11 -p tcp --dport 22 -j ACCEPT -i eth0

# Allow an ssh from friendly
iptables -A INPUT -s $FRIENDLY -p tcp --dport 22 -j ACCEPT

# rule to open a specific port on all interfaces - useful for callback catch/testing
# iptables -A INPUT -p  tcp --dport 4000 -j ACCEPT

#Established/related rule
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 

# Allow Loopback rules
iptables -A INPUT -j ACCEPT -i lo

# DEFAULT DROP NON-mATCHING RULES. Safe than POLICY
iptables -A INPUT -j DROP
