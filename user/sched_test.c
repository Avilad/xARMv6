#include "user.h"

#define SPIN(N) for (int __delay = 0; __delay < (1 << N); ++__delay) {asm volatile("nop");}

static inline void do_work(int id) {
  for (int i = 0; i < 10; ++i) {
    SPIN(22);
    printf(0, "%d", id);
  }
}

int main(int argc, char *argv[]) {
  printf(0, "Scheduler test starting...");
  int target_time = uptime() + 10;

  for(int i = 1; i <= 5; ++i) {
    if (fork() == 0) {
      sleep(target_time - uptime());
      do_work(i);
      exit();
    }
  }

  printf(0, " all processes spawned\n");
  while(wait() > 0);
  printf(0, "\ndone\n");

  exit();
}
