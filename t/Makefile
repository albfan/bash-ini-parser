SHELL_PATH ?= $(SHELL)
PROVE ?= prove
DEFAULT_TEST_TARGET ?= test
TAP_OUT ?= tapout

SHELL_PATH_SQ = $(subst ','\'',$(SHELL_PATH))

T = $(sort $(wildcard t[0-9][0-9][0-9][0-9]-*.sh))

all: $(DEFAULT_TEST_TARGET)

test: pre-clean
	@$(MAKE) aggregate-results-and-cleanup

prove: pre-clean
	@echo '*** prove ***'; prove --exec '$(SHELL_PATH_SQ)' $(PROVE_OPTS) $(T) :: $(TEST_OPTS)
	@$(MAKE) clean-except-prove-cache

tap: pre-clean clean-tap
	mkdir $(TAP_OUT)
	@$(MAKE) aggregate-results-and-cleanup

clean-tap:
	@$(RM) -r $(TAP_OUT)

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
ifeq ($(DEFAULT_TEST_TARGET),tap)
		@echo '*** $@ ***'; '$(SHELL_PATH_SQ)' $@ > $(TAP_OUT)/$@
else
		@echo '*** $@ ***'; '$(SHELL_PATH_SQ)' $@
endif

.PHONY: all test prove tap aggregate-results $(T)
.PHONY: pre-clean clean-except-prove-cache clean clean-tap aggregate-results-and-cleanup
