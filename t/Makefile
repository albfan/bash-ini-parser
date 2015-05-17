SHELL_PATH ?= /bin/bash
PROVE ?= prove
DEFAULT_TEST_TARGET ?= test

SHELL_PATH_SQ = $(subst ','\'',$(SHELL_PATH))

T = $(sort $(wildcard t[0-9][0-9][0-9][0-9]-*.sh))

all: $(DEFAULT_TEST_TARGET)

test: pre-clean
	@$(MAKE) aggregate-results-and-cleanup

prove: pre-clean
	@echo '*** prove ***'; prove --exec '$(SHELL_PATH_SQ)' $(PROVE_OPTS) $(T) :: $(TEST_OPTS)
	@$(MAKE) clean-except-prove-cache

aggregate-results:
	@for f in test-results/t*-*.counts; do \
		echo "$$f"; \
	done | '$(SHELL_PATH_SQ)' ./sharness/aggregate-results.sh

pre-clean:
	@$(RM) -r test-results

clean-except-prove-cache:
	@$(RM) -r 'trash directory'.* test-results

clean: clean-except-prove-cache
	@$(RM) .prove

aggregate-results-and-cleanup: $(T)
	@$(MAKE) aggregate-results
	@$(MAKE) clean

$(T):
	@echo '*** $@ ***'; '$(SHELL_PATH_SQ)' $@

.PHONY: all test prove aggregate-results $(T)
.PHONY: pre-clean clean-except-prove-cache clean aggregate-results-and-cleanup
