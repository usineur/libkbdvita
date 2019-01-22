TARGET_LIB = libkbdvita.a
OBJS       = kbdvita.o

PREFIX  = $(VITASDK)/arm-vita-eabi
CC      = arm-vita-eabi-gcc
AR      = arm-vita-eabi-ar
CFLAGS  = -Wl,-q -Wall -O3 -DUSE_VITA2D
ASFLAGS = $(CFLAGS)

all: $(TARGET_LIB)

$(TARGET_LIB): $(OBJS)
	$(AR) -rcs $@ $^

install: $(TARGET_LIB)
	@mkdir -p $(PREFIX)/lib/
	@cp $(TARGET_LIB) $(PREFIX)/lib/
	@mkdir -p $(PREFIX)/include/
	@cp kbdvita.h $(PREFIX)/include/
	@echo "Installed!"

clean:
	rm -rf $(TARGET_LIB) $(OBJS)
