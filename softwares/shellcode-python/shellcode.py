import ctypes
import mmap


def ace(data, arg):
  buf = mmap.mmap(-1, mmap.PAGESIZE, prot=mmap.PROT_READ | mmap.PROT_WRITE | mmap.PROT_EXEC)
  ftype = ctypes.CFUNCTYPE(ctypes.c_int)
  fpointer = ctypes.c_void_p.from_buffer(buf)

  _arbitraryFunction = ftype(ctypes.addressof(fpointer))
  
  buf.write(
    data
  )

  return _arbitraryFunction(arg)


print(ace(b"\x8b\xc7\x83\xc0\x01\xc3", 0))	# Increment one out of 0 (returns 1).

ace(b"\xeb\xfe\xc3", 0)			# Infinite loop (jump to previous instruction).
