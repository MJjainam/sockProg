INET(3)                   Linux Programmer's Manual                  INET(3)

NNAAMMEE
       inet_aton,   inet_addr,   inet_network,   inet_ntoa,   inet_makeaddr,
       inet_lnaof, inet_netof - Internet address manipulation routines

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<ssyyss//ssoocckkeett..hh>>
       ##iinncclluuddee <<nneettiinneett//iinn..hh>>
       ##iinncclluuddee <<aarrppaa//iinneett..hh>>

       iinntt iinneett__aattoonn((ccoonnsstt cchhaarr **_c_p,, ssttrruucctt iinn__aaddddrr **_i_n_p));;

       iinn__aaddddrr__tt iinneett__aaddddrr((ccoonnsstt cchhaarr **_c_p));;

       iinn__aaddddrr__tt iinneett__nneettwwoorrkk((ccoonnsstt cchhaarr **_c_p));;

       cchhaarr **iinneett__nnttooaa((ssttrruucctt iinn__aaddddrr _i_n));;

       ssttrruucctt iinn__aaddddrr iinneett__mmaakkeeaaddddrr((iinn__aaddddrr__tt _n_e_t,, iinn__aaddddrr__tt _h_o_s_t));;

       iinn__aaddddrr__tt iinneett__llnnaaooff((ssttrruucctt iinn__aaddddrr _i_n));;

       iinn__aaddddrr__tt iinneett__nneettooff((ssttrruucctt iinn__aaddddrr _i_n));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       iinneett__aattoonn(), iinneett__nnttooaa():
           Since glibc 2.19:
               _DEFAULT_SOURCE
           In glibc up to and including 2.19:
               _BSD_SOURCE || _BSD_SOURCE

DDEESSCCRRIIPPTTIIOONN
       iinneett__aattoonn() converts the Internet host address _c_p from the IPv4  num‐
       bers-and-dots  notation  into binary form (in network byte order) and
       stores it in the structure that _i_n_p points to.   iinneett__aattoonn()  returns
       nonzero  if  the address is valid, zero if not.  The address supplied
       in _c_p can have one of the following forms:

       _a_._b_._c_._d   Each of the four numeric parts  specifies  a  byte  of  the
                 address;  the  bytes are assigned in left-to-right order to
                 produce the binary address.

       _a_._b_._c     Parts _a and _b specify the first two  bytes  of  the  binary
                 address.   Part  _c  is  interpreted  as a 16-bit value that
                 defines the rightmost two  bytes  of  the  binary  address.
                 This notation is suitable for specifying (outmoded) Class B
                 network addresses.

       _a_._b       Part _a specifies the first  byte  of  the  binary  address.
                 Part  _b  is  interpreted as a 24-bit value that defines the
                 rightmost three bytes of the binary address.  This notation
                 is  suitable  for  specifying  (outmoded)  Class  A network
                 addresses.

       _a         The value _a is interpreted as a 32-bit value that is stored
                 directly  into  the  binary  address  without  any byte re‐
                 arrangement.

       In all of the above forms, components of the dotted  address  can  be
       specified  in decimal, octal (with a leading _0), or hexadecimal, with
       a leading _0_X).  Addresses in any  of  these  forms  are  collectively
       termed  _I_P_V_4  _n_u_m_b_e_r_s_-_a_n_d_-_d_o_t_s  _n_o_t_a_t_i_o_n.  The form that uses exactly
       four decimal numbers is referred to as _I_P_v_4  _d_o_t_t_e_d_-_d_e_c_i_m_a_l  _n_o_t_a_t_i_o_n
       (or sometimes: _I_P_v_4 _d_o_t_t_e_d_-_q_u_a_d _n_o_t_a_t_i_o_n).

       iinneett__aattoonn()  returns 1 if the supplied string was successfully inter‐
       preted, or 0 if the string is invalid (eerrrrnnoo is _n_o_t set on error).

       The iinneett__aaddddrr() function converts the Internet host address  _c_p  from
       IPv4  numbers-and-dots  notation  into  binary  data  in network byte
       order.   If  the  input  is  invalid,  IINNAADDDDRR__NNOONNEE  (usually  -1)  is
       returned.   Use of this function is problematic because -1 is a valid
       address (255.255.255.255).  Avoid its use in  favor  of  iinneett__aattoonn(),
       iinneett__ppttoonn(3), or ggeettaaddddrriinnffoo(3), which provide a cleaner way to indi‐
       cate error return.

       The iinneett__nneettwwoorrkk() function converts _c_p, a string  in  IPv4  numbers-
       and-dots  notation, into a number in host byte order suitable for use
       as an Internet network address.  On success, the converted address is
       returned.  If the input is invalid, -1 is returned.

       The iinneett__nnttooaa() function converts the Internet host address _i_n, given
       in network byte order, to a string in IPv4  dotted-decimal  notation.
       The string is returned in a statically allocated buffer, which subse‐
       quent calls will overwrite.

       The iinneett__llnnaaooff() function returns the local network address  part  of
       the Internet address _i_n.  The returned value is in host byte order.

       The  iinneett__nneettooff()  function  returns  the  network number part of the
       Internet address _i_n.  The returned value is in host byte order.

       The iinneett__mmaakkeeaaddddrr() function is  the  converse  of  iinneett__nneettooff()  and
       iinneett__llnnaaooff().   It  returns  an Internet host address in network byte
       order, created by combining the network number  _n_e_t  with  the  local
       address _h_o_s_t, both in host byte order.

       The  structure  _i_n___a_d_d_r  as  used  in  iinneett__nnttooaa(),  iinneett__mmaakkeeaaddddrr(),
       iinneett__llnnaaooff() and iinneett__nneettooff() is defined in _<_n_e_t_i_n_e_t_/_i_n_._h_> as:

           typedef uint32_t in_addr_t;

           struct in_addr {
               in_addr_t s_addr;
           };

AATTTTRRIIBBUUTTEESS
       For  an  explanation  of  the  terms  used  in  this   section,   see
       aattttrriibbuutteess(7).

       ┌───────────────────────────────┬───────────────┬────────────────┐
       │IInntteerrffaaccee                      │ AAttttrriibbuuttee     │ VVaalluuee          │
       ├───────────────────────────────┼───────────────┼────────────────┤
       │iinneett__aattoonn(), iinneett__aaddddrr(),      │ Thread safety │ MT-Safe locale │
       │iinneett__nneettwwoorrkk(), iinneett__nnttooaa()    │               │                │
       ├───────────────────────────────┼───────────────┼────────────────┤
       │iinneett__mmaakkeeaaddddrr(), iinneett__llnnaaooff(), │ Thread safety │ MT-Safe        │
       │iinneett__nneettooff()                   │               │                │
       └───────────────────────────────┴───────────────┴────────────────┘
CCOONNFFOORRMMIINNGG TTOO
       iinneett__aaddddrr(), iinneett__nnttooaa(): POSIX.1-2001, POSIX.1-2008, 4.3BSD.

       iinneett__aattoonn()  is  not  specified  in POSIX.1, but is available on most
       systems.

NNOOTTEESS
       On x86 architectures, the host byte order is Least  Significant  Byte
       first (little endian), whereas the network byte order, as used on the
       Internet, is Most Significant Byte first (big endian).

       iinneett__llnnaaooff(), iinneett__nneettooff(), and iinneett__mmaakkeeaaddddrr() are legacy  functions
       that assume they are dealing with _c_l_a_s_s_f_u_l _n_e_t_w_o_r_k _a_d_d_r_e_s_s_e_s.  Class‐
       ful networking divides IPv4 network addresses into host  and  network
       components at byte boundaries, as follows:

       Class A   This  address  type is indicated by the value 0 in the most
                 significant bit of the (network byte ordered) address.  The
                 network  address is contained in the most significant byte,
                 and the host address occupies the remaining three bytes.

       Class B   This address type is indicated by the binary  value  10  in
                 the  most significant two bits of the address.  The network
                 address is contained in the two most significant bytes, and
                 the host address occupies the remaining two bytes.

       Class C   This  address  type is indicated by the binary value 110 in
                 the most significant three bits of the address.   The  net‐
                 work  address  is  contained  in the three most significant
                 bytes, and the host address occupies the remaining byte.

       Classful network addresses are now obsolete, having  been  superseded
       by  Classless  Inter-Domain  Routing  (CIDR), which divides addresses
       into network and host components at arbitrary bit (rather than  byte)
       boundaries.

EEXXAAMMPPLLEE
       An  example of the use of iinneett__aattoonn() and iinneett__nnttooaa() is shown below.
       Here are some example runs:

           $ ..//aa..oouutt 222266..000000..000000..003377      # Last byte is in octal
           226.0.0.31
           $ ..//aa..oouutt 00xx77ff..11               # First byte is in hex
           127.0.0.1

   PPrrooggrraamm ssoouurrccee

       #define _BSD_SOURCE
       #include <arpa/inet.h>
       #include <stdio.h>
       #include <stdlib.h>

       int
       main(int argc, char *argv[])
       {
           struct in_addr addr;

           if (argc != 2) {
               fprintf(stderr, "%s <dotted-address>\n", argv[0]);
               exit(EXIT_FAILURE);
           }

           if (inet_aton(argv[1], &addr) == 0) {
               fprintf(stderr, "Invalid address\n");
               exit(EXIT_FAILURE);
           }

           printf("%s\n", inet_ntoa(addr));
           exit(EXIT_SUCCESS);
       }

SSEEEE AALLSSOO
       bbyytteeoorrddeerr(3), ggeettaaddddrriinnffoo(3), ggeetthhoossttbbyynnaammee(3), ggeettnnaammeeiinnffoo(3),  ggeett‐‐
       nneetteenntt(3),  iinneett__nneett__ppttoonn(3),  iinneett__nnttoopp(3),  iinneett__ppttoonn(3), hhoossttss(5),
       nneettwwoorrkkss(5)

CCOOLLOOPPHHOONN
       This page is part of release 4.10 of the Linux _m_a_n_-_p_a_g_e_s project.   A
       description of the project, information about reporting bugs, and the
       latest    version    of    this    page,    can    be    found     at
       https://www.kernel.org/doc/man-pages/.

GNU                              2016-03-15                          INET(3)
