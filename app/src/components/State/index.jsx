/* eslint-disable react/jsx-props-no-spreading */
/* eslint-disable react/prop-types */
import React, { Component } from 'react';
import _ from 'lodash';
import PropTypes from 'prop-types';
import { Slider, Space, Row, Col } from 'antd';
import client from '../../client';

import Player from '../Player';
import Actions from '../Actions';

async function updateHeartbeat(value) {
  const agent = client.service('agent');

  const data = {
    updateInterval: value,
  };
  return agent.create(data);
}

class State extends Component {
  constructor(props) {
    super(props);
    this.state = {
      agentState: {},
      gameState: {
        playerInCombat: false,
        target: false,
        spells: {},
      },
    };
  }

  async componentDidMount() {
    const agent = client.service('agent');
    const service = client.service('state');

    const agentState = await agent.find({});

    this.setState({ agentState });

    service.on('created', (gameState) =>
      this.setState({
        gameState,
      })
    );

    service.on('patched', (gameState) =>
      this.setState({
        gameState,
      })
    );

    agent.on('created', (as) => this.setState({ agentState: as }));
    agent.on('removed', (as) => this.setState({ agentState: as }));
  }

  render() {
    const { agentState, gameState } = this.state;

    const { status, updateInterval } = agentState;

    const {
      playerInCombat,
      target,
      targetIsDead,
      level,
      health,
      healthCurrent,
      mana,
      manaCurrent,
      spells,
    } = gameState;

    const playerProps = {
      level,
      health,
      healthCurrent,
      mana,
      manaCurrent,
      playerInCombat,
    };

    const actionProps = {
      status,
      goals: [
        {
          key: 'walk-to-corpse',
          goal: 'Walk to Corpse',
          actions: {
            playerInCombat,
            target,
          },
        },
        {
          key: 'target-dead',
          goal: 'Target Dead',
          actions: {
            target,
            targetIsDead,
          },
        },
        {
          key: 'combat',
          goal: 'Combat',
          actions: {
            playerInCombat,
            target,
            // targetInRange
          },
          children: Object.keys(spells).map((spellName) => {
            const { castable, equipped, notEnoughMana } = spells[spellName];

            return {
              key: spellName,
              goal: _.startCase(spellName),
              actions: {
                castable,
                equipped,
                notEnoughMana,
              },
            };
          }),
        },
        {
          key: 'pull-target',
          goal: 'Pull Target',
          actions: {
            playerInCombat,
            target,
            targetIsDead,
            // targetInRange
          },
        },
      ],
    };

    return (
      <Row>
        <Col>
          <div>Heartbeat: {updateInterval}</div>
          <Slider
            defaultValue={1000}
            min={50}
            max={5000}
            step={50}
            onChange={(value) => updateHeartbeat(value)}
          />
          <Space direction="vertical">
            <Player {...playerProps} />
            <Actions {...actionProps} />
            Current State:
            <pre>
              <code>{JSON.stringify(gameState, null, 2)}</code>
            </pre>
          </Space>
        </Col>
      </Row>
    );
  }
}

State.propTypes = {
  gameState: {
    level: PropTypes.string,
    health: PropTypes.string,
  },
};

export default State;
