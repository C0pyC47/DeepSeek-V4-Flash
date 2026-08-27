GGUF_REPO = antirez/deepseek-v4-gguf
GGUF_FILE = DeepSeek-V4-Flash-IQ2XXS-w2Q2K-AProjQ8-SExpQ8-OutQ8-chat-v2-imatrix-0731.gguf
DSPARK_REPO = bleysg/DeepSeek-V4-Flash-DSpark-drafter-GGUF
DSPARK_FILE = DSpark-drafter-Q2K-Q8-0731.gguf

CTX_SIZE = 262144

.PHONY: all setup serve clean

all: setup serve

setup:
	hf download $(GGUF_REPO) $(GGUF_FILE) --local-dir ./gguf
	hf download $(DSPARK_REPO) $(DSPARK_FILE) --local-dir ./gguf
	printf 'GGUF_FILE=%s\nDSPARK_FILE=%s\nCTX_SIZE=%s\n' '$(GGUF_FILE)' '$(DSPARK_FILE)' '$(CTX_SIZE)' > .env
	docker compose build

serve:
	docker compose up -d

clean:
	docker compose down --rmi local
	rm -rf ./gguf
	rm -f .env
