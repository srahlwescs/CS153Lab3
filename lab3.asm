
_lab3:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
}
#pragma GCC pop_options

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	83 ec 10             	sub    $0x10,%esp
    100a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 int n, m;
 printf(1,"%p\n",&argc);
    100d:	8d 45 08             	lea    0x8(%ebp),%eax
    1010:	89 44 24 08          	mov    %eax,0x8(%esp)
    1014:	c7 44 24 04 f1 17 00 	movl   $0x17f1,0x4(%esp)
    101b:	00 
    101c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1023:	e8 28 04 00 00       	call   1450 <printf>

 if(argc != 2)
    1028:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    102c:	74 1f                	je     104d <main+0x4d>
  {
   printf(1, "Usage: %s levels\n", argv[0]);
    102e:	8b 03                	mov    (%ebx),%eax
    1030:	c7 44 24 04 f5 17 00 	movl   $0x17f5,0x4(%esp)
    1037:	00 
    1038:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    103f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1043:	e8 08 04 00 00       	call   1450 <printf>
   exit();
    1048:	e8 a5 02 00 00       	call   12f2 <exit>
  }
  n = atoi(argv[1]);
    104d:	8b 43 04             	mov    0x4(%ebx),%eax
    1050:	89 04 24             	mov    %eax,(%esp)
    1053:	e8 38 02 00 00       	call   1290 <atoi>
  printf(1, "Lab 3: Recursing %d levels\n", n);
    1058:	c7 44 24 04 07 18 00 	movl   $0x1807,0x4(%esp)
    105f:	00 
    1060:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  n = atoi(argv[1]);
    1067:	89 c3                	mov    %eax,%ebx
  printf(1, "Lab 3: Recursing %d levels\n", n);
    1069:	89 44 24 08          	mov    %eax,0x8(%esp)
    106d:	e8 de 03 00 00       	call   1450 <printf>
  m  = recurse(n);
    1072:	89 1c 24             	mov    %ebx,(%esp)
    1075:	e8 26 00 00 00       	call   10a0 <recurse>
  printf(1, "Lab 3: Yielded a value of %d\n", m);
    107a:	c7 44 24 04 23 18 00 	movl   $0x1823,0x4(%esp)
    1081:	00 
    1082:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1089:	89 44 24 08          	mov    %eax,0x8(%esp)
    108d:	e8 be 03 00 00       	call   1450 <printf>
  exit();
    1092:	e8 5b 02 00 00       	call   12f2 <exit>
    1097:	66 90                	xchg   %ax,%ax
    1099:	66 90                	xchg   %ax,%ax
    109b:	66 90                	xchg   %ax,%ax
    109d:	66 90                	xchg   %ax,%ax
    109f:	90                   	nop

000010a0 <recurse>:
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	83 ec 18             	sub    $0x18,%esp
 if(n == 0)
    10a6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    10aa:	75 07                	jne    10b3 <recurse+0x13>
  return 0;
    10ac:	b8 00 00 00 00       	mov    $0x0,%eax
    10b1:	eb 13                	jmp    10c6 <recurse+0x26>
 return n + recurse(n - 1);
    10b3:	8b 45 08             	mov    0x8(%ebp),%eax
    10b6:	83 e8 01             	sub    $0x1,%eax
    10b9:	89 04 24             	mov    %eax,(%esp)
    10bc:	e8 df ff ff ff       	call   10a0 <recurse>
    10c1:	8b 55 08             	mov    0x8(%ebp),%edx
    10c4:	01 d0                	add    %edx,%eax
}
    10c6:	c9                   	leave  
    10c7:	c3                   	ret    
    10c8:	66 90                	xchg   %ax,%ax
    10ca:	66 90                	xchg   %ax,%ax
    10cc:	66 90                	xchg   %ax,%ax
    10ce:	66 90                	xchg   %ax,%ax

000010d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 45 08             	mov    0x8(%ebp),%eax
    10d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    10d9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10da:	89 c2                	mov    %eax,%edx
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10e0:	83 c1 01             	add    $0x1,%ecx
    10e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10e7:	83 c2 01             	add    $0x1,%edx
    10ea:	84 db                	test   %bl,%bl
    10ec:	88 5a ff             	mov    %bl,-0x1(%edx)
    10ef:	75 ef                	jne    10e0 <strcpy+0x10>
    ;
  return os;
}
    10f1:	5b                   	pop    %ebx
    10f2:	5d                   	pop    %ebp
    10f3:	c3                   	ret    
    10f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001100 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 55 08             	mov    0x8(%ebp),%edx
    1106:	53                   	push   %ebx
    1107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    110a:	0f b6 02             	movzbl (%edx),%eax
    110d:	84 c0                	test   %al,%al
    110f:	74 2d                	je     113e <strcmp+0x3e>
    1111:	0f b6 19             	movzbl (%ecx),%ebx
    1114:	38 d8                	cmp    %bl,%al
    1116:	74 0e                	je     1126 <strcmp+0x26>
    1118:	eb 2b                	jmp    1145 <strcmp+0x45>
    111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1120:	38 c8                	cmp    %cl,%al
    1122:	75 15                	jne    1139 <strcmp+0x39>
    p++, q++;
    1124:	89 d9                	mov    %ebx,%ecx
    1126:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1129:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    112c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    112f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1133:	84 c0                	test   %al,%al
    1135:	75 e9                	jne    1120 <strcmp+0x20>
    1137:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1139:	29 c8                	sub    %ecx,%eax
}
    113b:	5b                   	pop    %ebx
    113c:	5d                   	pop    %ebp
    113d:	c3                   	ret    
    113e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
    1141:	31 c0                	xor    %eax,%eax
    1143:	eb f4                	jmp    1139 <strcmp+0x39>
    1145:	0f b6 cb             	movzbl %bl,%ecx
    1148:	eb ef                	jmp    1139 <strcmp+0x39>
    114a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001150 <strlen>:

uint
strlen(char *s)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1156:	80 39 00             	cmpb   $0x0,(%ecx)
    1159:	74 12                	je     116d <strlen+0x1d>
    115b:	31 d2                	xor    %edx,%edx
    115d:	8d 76 00             	lea    0x0(%esi),%esi
    1160:	83 c2 01             	add    $0x1,%edx
    1163:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1167:	89 d0                	mov    %edx,%eax
    1169:	75 f5                	jne    1160 <strlen+0x10>
    ;
  return n;
}
    116b:	5d                   	pop    %ebp
    116c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    116d:	31 c0                	xor    %eax,%eax
}
    116f:	5d                   	pop    %ebp
    1170:	c3                   	ret    
    1171:	eb 0d                	jmp    1180 <memset>
    1173:	90                   	nop
    1174:	90                   	nop
    1175:	90                   	nop
    1176:	90                   	nop
    1177:	90                   	nop
    1178:	90                   	nop
    1179:	90                   	nop
    117a:	90                   	nop
    117b:	90                   	nop
    117c:	90                   	nop
    117d:	90                   	nop
    117e:	90                   	nop
    117f:	90                   	nop

00001180 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	8b 55 08             	mov    0x8(%ebp),%edx
    1186:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1187:	8b 4d 10             	mov    0x10(%ebp),%ecx
    118a:	8b 45 0c             	mov    0xc(%ebp),%eax
    118d:	89 d7                	mov    %edx,%edi
    118f:	fc                   	cld    
    1190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1192:	89 d0                	mov    %edx,%eax
    1194:	5f                   	pop    %edi
    1195:	5d                   	pop    %ebp
    1196:	c3                   	ret    
    1197:	89 f6                	mov    %esi,%esi
    1199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011a0 <strchr>:

char*
strchr(const char *s, char c)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	8b 45 08             	mov    0x8(%ebp),%eax
    11a6:	53                   	push   %ebx
    11a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    11aa:	0f b6 18             	movzbl (%eax),%ebx
    11ad:	84 db                	test   %bl,%bl
    11af:	74 1d                	je     11ce <strchr+0x2e>
    if(*s == c)
    11b1:	38 d3                	cmp    %dl,%bl
    11b3:	89 d1                	mov    %edx,%ecx
    11b5:	75 0d                	jne    11c4 <strchr+0x24>
    11b7:	eb 17                	jmp    11d0 <strchr+0x30>
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11c0:	38 ca                	cmp    %cl,%dl
    11c2:	74 0c                	je     11d0 <strchr+0x30>
  for(; *s; s++)
    11c4:	83 c0 01             	add    $0x1,%eax
    11c7:	0f b6 10             	movzbl (%eax),%edx
    11ca:	84 d2                	test   %dl,%dl
    11cc:	75 f2                	jne    11c0 <strchr+0x20>
      return (char*)s;
  return 0;
    11ce:	31 c0                	xor    %eax,%eax
}
    11d0:	5b                   	pop    %ebx
    11d1:	5d                   	pop    %ebp
    11d2:	c3                   	ret    
    11d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <gets>:

char*
gets(char *buf, int max)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11e5:	31 f6                	xor    %esi,%esi
{
    11e7:	53                   	push   %ebx
    11e8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
    11eb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
    11ee:	eb 31                	jmp    1221 <gets+0x41>
    cc = read(0, &c, 1);
    11f0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11f7:	00 
    11f8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    11fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1203:	e8 02 01 00 00       	call   130a <read>
    if(cc < 1)
    1208:	85 c0                	test   %eax,%eax
    120a:	7e 1d                	jle    1229 <gets+0x49>
      break;
    buf[i++] = c;
    120c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
    1210:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
    1212:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1215:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
    1217:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    121b:	74 0c                	je     1229 <gets+0x49>
    121d:	3c 0a                	cmp    $0xa,%al
    121f:	74 08                	je     1229 <gets+0x49>
  for(i=0; i+1 < max; ){
    1221:	8d 5e 01             	lea    0x1(%esi),%ebx
    1224:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1227:	7c c7                	jl     11f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    1229:	8b 45 08             	mov    0x8(%ebp),%eax
    122c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1230:	83 c4 2c             	add    $0x2c,%esp
    1233:	5b                   	pop    %ebx
    1234:	5e                   	pop    %esi
    1235:	5f                   	pop    %edi
    1236:	5d                   	pop    %ebp
    1237:	c3                   	ret    
    1238:	90                   	nop
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001240 <stat>:

int
stat(char *n, struct stat *st)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	56                   	push   %esi
    1244:	53                   	push   %ebx
    1245:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1248:	8b 45 08             	mov    0x8(%ebp),%eax
    124b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1252:	00 
    1253:	89 04 24             	mov    %eax,(%esp)
    1256:	e8 d7 00 00 00       	call   1332 <open>
  if(fd < 0)
    125b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
    125d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    125f:	78 27                	js     1288 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1261:	8b 45 0c             	mov    0xc(%ebp),%eax
    1264:	89 1c 24             	mov    %ebx,(%esp)
    1267:	89 44 24 04          	mov    %eax,0x4(%esp)
    126b:	e8 da 00 00 00       	call   134a <fstat>
  close(fd);
    1270:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1273:	89 c6                	mov    %eax,%esi
  close(fd);
    1275:	e8 a0 00 00 00       	call   131a <close>
  return r;
    127a:	89 f0                	mov    %esi,%eax
}
    127c:	83 c4 10             	add    $0x10,%esp
    127f:	5b                   	pop    %ebx
    1280:	5e                   	pop    %esi
    1281:	5d                   	pop    %ebp
    1282:	c3                   	ret    
    1283:	90                   	nop
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1288:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    128d:	eb ed                	jmp    127c <stat+0x3c>
    128f:	90                   	nop

00001290 <atoi>:

int
atoi(const char *s)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1296:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1297:	0f be 11             	movsbl (%ecx),%edx
    129a:	8d 42 d0             	lea    -0x30(%edx),%eax
    129d:	3c 09                	cmp    $0x9,%al
  n = 0;
    129f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12a4:	77 17                	ja     12bd <atoi+0x2d>
    12a6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12a8:	83 c1 01             	add    $0x1,%ecx
    12ab:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12ae:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    12b2:	0f be 11             	movsbl (%ecx),%edx
    12b5:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12b8:	80 fb 09             	cmp    $0x9,%bl
    12bb:	76 eb                	jbe    12a8 <atoi+0x18>
  return n;
}
    12bd:	5b                   	pop    %ebx
    12be:	5d                   	pop    %ebp
    12bf:	c3                   	ret    

000012c0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12c0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12c1:	31 d2                	xor    %edx,%edx
{
    12c3:	89 e5                	mov    %esp,%ebp
    12c5:	56                   	push   %esi
    12c6:	8b 45 08             	mov    0x8(%ebp),%eax
    12c9:	53                   	push   %ebx
    12ca:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12cd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
    12d0:	85 db                	test   %ebx,%ebx
    12d2:	7e 12                	jle    12e6 <memmove+0x26>
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    12e2:	39 da                	cmp    %ebx,%edx
    12e4:	75 f2                	jne    12d8 <memmove+0x18>
  return vdst;
}
    12e6:	5b                   	pop    %ebx
    12e7:	5e                   	pop    %esi
    12e8:	5d                   	pop    %ebp
    12e9:	c3                   	ret    

000012ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ea:	b8 01 00 00 00       	mov    $0x1,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <exit>:
SYSCALL(exit)
    12f2:	b8 02 00 00 00       	mov    $0x2,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <wait>:
SYSCALL(wait)
    12fa:	b8 03 00 00 00       	mov    $0x3,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <pipe>:
SYSCALL(pipe)
    1302:	b8 04 00 00 00       	mov    $0x4,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <read>:
SYSCALL(read)
    130a:	b8 05 00 00 00       	mov    $0x5,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <write>:
SYSCALL(write)
    1312:	b8 10 00 00 00       	mov    $0x10,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <close>:
SYSCALL(close)
    131a:	b8 15 00 00 00       	mov    $0x15,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <kill>:
SYSCALL(kill)
    1322:	b8 06 00 00 00       	mov    $0x6,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <exec>:
SYSCALL(exec)
    132a:	b8 07 00 00 00       	mov    $0x7,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <open>:
SYSCALL(open)
    1332:	b8 0f 00 00 00       	mov    $0xf,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <mknod>:
SYSCALL(mknod)
    133a:	b8 11 00 00 00       	mov    $0x11,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <unlink>:
SYSCALL(unlink)
    1342:	b8 12 00 00 00       	mov    $0x12,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <fstat>:
SYSCALL(fstat)
    134a:	b8 08 00 00 00       	mov    $0x8,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <link>:
SYSCALL(link)
    1352:	b8 13 00 00 00       	mov    $0x13,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <mkdir>:
SYSCALL(mkdir)
    135a:	b8 14 00 00 00       	mov    $0x14,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <chdir>:
SYSCALL(chdir)
    1362:	b8 09 00 00 00       	mov    $0x9,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <dup>:
SYSCALL(dup)
    136a:	b8 0a 00 00 00       	mov    $0xa,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <getpid>:
SYSCALL(getpid)
    1372:	b8 0b 00 00 00       	mov    $0xb,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <sbrk>:
SYSCALL(sbrk)
    137a:	b8 0c 00 00 00       	mov    $0xc,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <sleep>:
SYSCALL(sleep)
    1382:	b8 0d 00 00 00       	mov    $0xd,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <uptime>:
SYSCALL(uptime)
    138a:	b8 0e 00 00 00       	mov    $0xe,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <shm_open>:
SYSCALL(shm_open)
    1392:	b8 16 00 00 00       	mov    $0x16,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <shm_close>:
SYSCALL(shm_close)	
    139a:	b8 17 00 00 00       	mov    $0x17,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    
    13a2:	66 90                	xchg   %ax,%ax
    13a4:	66 90                	xchg   %ax,%ax
    13a6:	66 90                	xchg   %ax,%ax
    13a8:	66 90                	xchg   %ax,%ax
    13aa:	66 90                	xchg   %ax,%ax
    13ac:	66 90                	xchg   %ax,%ax
    13ae:	66 90                	xchg   %ax,%ax

000013b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	57                   	push   %edi
    13b4:	56                   	push   %esi
    13b5:	89 c6                	mov    %eax,%esi
    13b7:	53                   	push   %ebx
    13b8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13be:	85 db                	test   %ebx,%ebx
    13c0:	74 09                	je     13cb <printint+0x1b>
    13c2:	89 d0                	mov    %edx,%eax
    13c4:	c1 e8 1f             	shr    $0x1f,%eax
    13c7:	84 c0                	test   %al,%al
    13c9:	75 75                	jne    1440 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13cb:	89 d0                	mov    %edx,%eax
  neg = 0;
    13cd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13d4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
    13d7:	31 ff                	xor    %edi,%edi
    13d9:	89 ce                	mov    %ecx,%esi
    13db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13de:	eb 02                	jmp    13e2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    13e0:	89 cf                	mov    %ecx,%edi
    13e2:	31 d2                	xor    %edx,%edx
    13e4:	f7 f6                	div    %esi
    13e6:	8d 4f 01             	lea    0x1(%edi),%ecx
    13e9:	0f b6 92 48 18 00 00 	movzbl 0x1848(%edx),%edx
  }while((x /= base) != 0);
    13f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    13f2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    13f5:	75 e9                	jne    13e0 <printint+0x30>
  if(neg)
    13f7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
    13fa:	89 c8                	mov    %ecx,%eax
    13fc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
    13ff:	85 d2                	test   %edx,%edx
    1401:	74 08                	je     140b <printint+0x5b>
    buf[i++] = '-';
    1403:	8d 4f 02             	lea    0x2(%edi),%ecx
    1406:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    140b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    140e:	66 90                	xchg   %ax,%ax
    1410:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1415:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    1418:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    141f:	00 
    1420:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1424:	89 34 24             	mov    %esi,(%esp)
    1427:	88 45 d7             	mov    %al,-0x29(%ebp)
    142a:	e8 e3 fe ff ff       	call   1312 <write>
  while(--i >= 0)
    142f:	83 ff ff             	cmp    $0xffffffff,%edi
    1432:	75 dc                	jne    1410 <printint+0x60>
    putc(fd, buf[i]);
}
    1434:	83 c4 4c             	add    $0x4c,%esp
    1437:	5b                   	pop    %ebx
    1438:	5e                   	pop    %esi
    1439:	5f                   	pop    %edi
    143a:	5d                   	pop    %ebp
    143b:	c3                   	ret    
    143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
    1440:	89 d0                	mov    %edx,%eax
    1442:	f7 d8                	neg    %eax
    neg = 1;
    1444:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    144b:	eb 87                	jmp    13d4 <printint+0x24>
    144d:	8d 76 00             	lea    0x0(%esi),%esi

00001450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1454:	31 ff                	xor    %edi,%edi
{
    1456:	56                   	push   %esi
    1457:	53                   	push   %ebx
    1458:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    145b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
    145e:	8d 45 10             	lea    0x10(%ebp),%eax
{
    1461:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
    1464:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1467:	0f b6 13             	movzbl (%ebx),%edx
    146a:	83 c3 01             	add    $0x1,%ebx
    146d:	84 d2                	test   %dl,%dl
    146f:	75 39                	jne    14aa <printf+0x5a>
    1471:	e9 c2 00 00 00       	jmp    1538 <printf+0xe8>
    1476:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1478:	83 fa 25             	cmp    $0x25,%edx
    147b:	0f 84 bf 00 00 00    	je     1540 <printf+0xf0>
  write(fd, &c, 1);
    1481:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1484:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    148b:	00 
    148c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1490:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1493:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
    1496:	e8 77 fe ff ff       	call   1312 <write>
    149b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    149e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14a2:	84 d2                	test   %dl,%dl
    14a4:	0f 84 8e 00 00 00    	je     1538 <printf+0xe8>
    if(state == 0){
    14aa:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    14ac:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    14af:	74 c7                	je     1478 <printf+0x28>
      }
    } else if(state == '%'){
    14b1:	83 ff 25             	cmp    $0x25,%edi
    14b4:	75 e5                	jne    149b <printf+0x4b>
      if(c == 'd'){
    14b6:	83 fa 64             	cmp    $0x64,%edx
    14b9:	0f 84 31 01 00 00    	je     15f0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14bf:	25 f7 00 00 00       	and    $0xf7,%eax
    14c4:	83 f8 70             	cmp    $0x70,%eax
    14c7:	0f 84 83 00 00 00    	je     1550 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14cd:	83 fa 73             	cmp    $0x73,%edx
    14d0:	0f 84 a2 00 00 00    	je     1578 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14d6:	83 fa 63             	cmp    $0x63,%edx
    14d9:	0f 84 35 01 00 00    	je     1614 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14df:	83 fa 25             	cmp    $0x25,%edx
    14e2:	0f 84 e0 00 00 00    	je     15c8 <printf+0x178>
  write(fd, &c, 1);
    14e8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14eb:	83 c3 01             	add    $0x1,%ebx
    14ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14f5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14f6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    14f8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14fc:	89 34 24             	mov    %esi,(%esp)
    14ff:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1502:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1506:	e8 07 fe ff ff       	call   1312 <write>
        putc(fd, c);
    150b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    150e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1511:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1518:	00 
    1519:	89 44 24 04          	mov    %eax,0x4(%esp)
    151d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    1520:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    1523:	e8 ea fd ff ff       	call   1312 <write>
  for(i = 0; fmt[i]; i++){
    1528:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    152c:	84 d2                	test   %dl,%dl
    152e:	0f 85 76 ff ff ff    	jne    14aa <printf+0x5a>
    1534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
    1538:	83 c4 3c             	add    $0x3c,%esp
    153b:	5b                   	pop    %ebx
    153c:	5e                   	pop    %esi
    153d:	5f                   	pop    %edi
    153e:	5d                   	pop    %ebp
    153f:	c3                   	ret    
        state = '%';
    1540:	bf 25 00 00 00       	mov    $0x25,%edi
    1545:	e9 51 ff ff ff       	jmp    149b <printf+0x4b>
    154a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1550:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1553:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
    1558:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    155a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1561:	8b 10                	mov    (%eax),%edx
    1563:	89 f0                	mov    %esi,%eax
    1565:	e8 46 fe ff ff       	call   13b0 <printint>
        ap++;
    156a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    156e:	e9 28 ff ff ff       	jmp    149b <printf+0x4b>
    1573:	90                   	nop
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1578:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    157b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    157f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1581:	b8 41 18 00 00       	mov    $0x1841,%eax
    1586:	85 ff                	test   %edi,%edi
    1588:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    158b:	0f b6 07             	movzbl (%edi),%eax
    158e:	84 c0                	test   %al,%al
    1590:	74 2a                	je     15bc <printf+0x16c>
    1592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1598:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    159b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    159e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    15a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15a8:	00 
    15a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ad:	89 34 24             	mov    %esi,(%esp)
    15b0:	e8 5d fd ff ff       	call   1312 <write>
        while(*s != 0){
    15b5:	0f b6 07             	movzbl (%edi),%eax
    15b8:	84 c0                	test   %al,%al
    15ba:	75 dc                	jne    1598 <printf+0x148>
      state = 0;
    15bc:	31 ff                	xor    %edi,%edi
    15be:	e9 d8 fe ff ff       	jmp    149b <printf+0x4b>
    15c3:	90                   	nop
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    15c8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    15cb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    15cd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15d4:	00 
    15d5:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d9:	89 34 24             	mov    %esi,(%esp)
    15dc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    15e0:	e8 2d fd ff ff       	call   1312 <write>
    15e5:	e9 b1 fe ff ff       	jmp    149b <printf+0x4b>
    15ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    15f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
    15f8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
    15fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1602:	8b 10                	mov    (%eax),%edx
    1604:	89 f0                	mov    %esi,%eax
    1606:	e8 a5 fd ff ff       	call   13b0 <printint>
        ap++;
    160b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    160f:	e9 87 fe ff ff       	jmp    149b <printf+0x4b>
        putc(fd, *ap);
    1614:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1617:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1619:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    161b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1622:	00 
    1623:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    1626:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    1629:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    162c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1630:	e8 dd fc ff ff       	call   1312 <write>
        ap++;
    1635:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1639:	e9 5d fe ff ff       	jmp    149b <printf+0x4b>
    163e:	66 90                	xchg   %ax,%ax

00001640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1641:	a1 20 1b 00 00       	mov    0x1b20,%eax
{
    1646:	89 e5                	mov    %esp,%ebp
    1648:	57                   	push   %edi
    1649:	56                   	push   %esi
    164a:	53                   	push   %ebx
    164b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    164e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1650:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1653:	39 d0                	cmp    %edx,%eax
    1655:	72 11                	jb     1668 <free+0x28>
    1657:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1658:	39 c8                	cmp    %ecx,%eax
    165a:	72 04                	jb     1660 <free+0x20>
    165c:	39 ca                	cmp    %ecx,%edx
    165e:	72 10                	jb     1670 <free+0x30>
    1660:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1662:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1664:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1666:	73 f0                	jae    1658 <free+0x18>
    1668:	39 ca                	cmp    %ecx,%edx
    166a:	72 04                	jb     1670 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    166c:	39 c8                	cmp    %ecx,%eax
    166e:	72 f0                	jb     1660 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1670:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1673:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1676:	39 cf                	cmp    %ecx,%edi
    1678:	74 1e                	je     1698 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    167a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    167d:	8b 48 04             	mov    0x4(%eax),%ecx
    1680:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1683:	39 f2                	cmp    %esi,%edx
    1685:	74 28                	je     16af <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1687:	89 10                	mov    %edx,(%eax)
  freep = p;
    1689:	a3 20 1b 00 00       	mov    %eax,0x1b20
}
    168e:	5b                   	pop    %ebx
    168f:	5e                   	pop    %esi
    1690:	5f                   	pop    %edi
    1691:	5d                   	pop    %ebp
    1692:	c3                   	ret    
    1693:	90                   	nop
    1694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1698:	03 71 04             	add    0x4(%ecx),%esi
    169b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    169e:	8b 08                	mov    (%eax),%ecx
    16a0:	8b 09                	mov    (%ecx),%ecx
    16a2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16a5:	8b 48 04             	mov    0x4(%eax),%ecx
    16a8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16ab:	39 f2                	cmp    %esi,%edx
    16ad:	75 d8                	jne    1687 <free+0x47>
    p->s.size += bp->s.size;
    16af:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    16b2:	a3 20 1b 00 00       	mov    %eax,0x1b20
    p->s.size += bp->s.size;
    16b7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16ba:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16bd:	89 10                	mov    %edx,(%eax)
}
    16bf:	5b                   	pop    %ebx
    16c0:	5e                   	pop    %esi
    16c1:	5f                   	pop    %edi
    16c2:	5d                   	pop    %ebp
    16c3:	c3                   	ret    
    16c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    16ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000016d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16d0:	55                   	push   %ebp
    16d1:	89 e5                	mov    %esp,%ebp
    16d3:	57                   	push   %edi
    16d4:	56                   	push   %esi
    16d5:	53                   	push   %ebx
    16d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16dc:	8b 1d 20 1b 00 00    	mov    0x1b20,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16e2:	8d 48 07             	lea    0x7(%eax),%ecx
    16e5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    16e8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16ea:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    16ed:	0f 84 9b 00 00 00    	je     178e <malloc+0xbe>
    16f3:	8b 13                	mov    (%ebx),%edx
    16f5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16f8:	39 fe                	cmp    %edi,%esi
    16fa:	76 64                	jbe    1760 <malloc+0x90>
    16fc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    1703:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1708:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    170b:	eb 0e                	jmp    171b <malloc+0x4b>
    170d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1710:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1712:	8b 78 04             	mov    0x4(%eax),%edi
    1715:	39 fe                	cmp    %edi,%esi
    1717:	76 4f                	jbe    1768 <malloc+0x98>
    1719:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    171b:	3b 15 20 1b 00 00    	cmp    0x1b20,%edx
    1721:	75 ed                	jne    1710 <malloc+0x40>
  if(nu < 4096)
    1723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1726:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    172c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1731:	0f 43 fe             	cmovae %esi,%edi
    1734:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1737:	89 04 24             	mov    %eax,(%esp)
    173a:	e8 3b fc ff ff       	call   137a <sbrk>
  if(p == (char*)-1)
    173f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1742:	74 18                	je     175c <malloc+0x8c>
  hp->s.size = nu;
    1744:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1747:	83 c0 08             	add    $0x8,%eax
    174a:	89 04 24             	mov    %eax,(%esp)
    174d:	e8 ee fe ff ff       	call   1640 <free>
  return freep;
    1752:	8b 15 20 1b 00 00    	mov    0x1b20,%edx
      if((p = morecore(nunits)) == 0)
    1758:	85 d2                	test   %edx,%edx
    175a:	75 b4                	jne    1710 <malloc+0x40>
        return 0;
    175c:	31 c0                	xor    %eax,%eax
    175e:	eb 20                	jmp    1780 <malloc+0xb0>
    if(p->s.size >= nunits){
    1760:	89 d0                	mov    %edx,%eax
    1762:	89 da                	mov    %ebx,%edx
    1764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1768:	39 fe                	cmp    %edi,%esi
    176a:	74 1c                	je     1788 <malloc+0xb8>
        p->s.size -= nunits;
    176c:	29 f7                	sub    %esi,%edi
    176e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1771:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1774:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1777:	89 15 20 1b 00 00    	mov    %edx,0x1b20
      return (void*)(p + 1);
    177d:	83 c0 08             	add    $0x8,%eax
  }
}
    1780:	83 c4 1c             	add    $0x1c,%esp
    1783:	5b                   	pop    %ebx
    1784:	5e                   	pop    %esi
    1785:	5f                   	pop    %edi
    1786:	5d                   	pop    %ebp
    1787:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1788:	8b 08                	mov    (%eax),%ecx
    178a:	89 0a                	mov    %ecx,(%edx)
    178c:	eb e9                	jmp    1777 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    178e:	c7 05 20 1b 00 00 24 	movl   $0x1b24,0x1b20
    1795:	1b 00 00 
    base.s.size = 0;
    1798:	ba 24 1b 00 00       	mov    $0x1b24,%edx
    base.s.ptr = freep = prevp = &base;
    179d:	c7 05 24 1b 00 00 24 	movl   $0x1b24,0x1b24
    17a4:	1b 00 00 
    base.s.size = 0;
    17a7:	c7 05 28 1b 00 00 00 	movl   $0x0,0x1b28
    17ae:	00 00 00 
    17b1:	e9 46 ff ff ff       	jmp    16fc <malloc+0x2c>
    17b6:	66 90                	xchg   %ax,%ax
    17b8:	66 90                	xchg   %ax,%ax
    17ba:	66 90                	xchg   %ax,%ax
    17bc:	66 90                	xchg   %ax,%ax
    17be:	66 90                	xchg   %ax,%ax

000017c0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17c0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17c1:	b9 01 00 00 00       	mov    $0x1,%ecx
    17c6:	89 e5                	mov    %esp,%ebp
    17c8:	8b 55 08             	mov    0x8(%ebp),%edx
    17cb:	90                   	nop
    17cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17d0:	89 c8                	mov    %ecx,%eax
    17d2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17d5:	85 c0                	test   %eax,%eax
    17d7:	75 f7                	jne    17d0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17d9:	0f ae f0             	mfence 
}
    17dc:	5d                   	pop    %ebp
    17dd:	c3                   	ret    
    17de:	66 90                	xchg   %ax,%ax

000017e0 <urelease>:

void urelease (struct uspinlock *lk) {
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17e6:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17e9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17ef:	5d                   	pop    %ebp
    17f0:	c3                   	ret    
