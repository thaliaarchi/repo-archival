def escape(c):
    if c == ' ':
        return ' '
    elif c == '\n':
        return '\\n\n'
    elif c == '\r':
        return r'\r'
    elif c == '\t':
        return r'\t'
    elif c <= '\xff':
        return r'\x{0:02x}'.format(ord(c))
    else:
        return c.encode('unicode_escape').decode('ascii')

def highlight_escape(c):
    if c.isprintable():
        return c
    else:
        return '\x1b[41m' + escape(c) + '\x1b[0m'

return ''.join(highlight_escape(chr(c)) for c in message).encode('utf-8')
