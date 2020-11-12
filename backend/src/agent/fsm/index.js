const StateMachine = require('javascript-state-machine');

const count = 0;
const log = function (msg, separate) {
  console.log(msg);
};

const goals = new StateMachine({
  init: 'idle',
  transitions: [
    { name: 'kill', from: 'combat', to: 'idle' },
    { name: 'pull', from: 'idle', to: 'pulling' },
    { name: 'acquireTarget', from: 'pulling', to: 'combat' },
  ],
  methods: {
    onTransition(lifecycle) {
      log(
        `DURING: ${lifecycle.transition} (from ${lifecycle.from} to ${lifecycle.to})`
      );
    },
    onKill() {
      console.log('target killed');
    },
    onPull() {
      console.log('pulling target');
    },
    onAcquireTarget() {
      console.log('acquired target');
    },
  },
});
