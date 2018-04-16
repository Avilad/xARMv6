#ifndef UART_H
#define UART_H

void uart0_init(void);
void uart0_send_char(char c);
char uart0_get_char(void);
void uart0_put_str(char* s);

#endif // UART_H
