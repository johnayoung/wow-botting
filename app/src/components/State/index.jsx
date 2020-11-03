/* eslint-disable react/prop-types */
import React, { Component } from 'react';
import { Tag } from 'antd';
import client from '../../client';

const booleanConfig = {
  playerInCombat: {
    valueIfTrue: 'IN COMBAT',
    valueIfFalse: 'OUT OF COMBAT',
  },
  target: {
    valueIfTrue: 'HAS A TARGET',
    valueIfFalse: 'NO TARGET',
  },
};

function BooleanTag({ tag, tagName }) {
  let color = 'green';
  if (tag) {
    color = 'volcano';
  }

  const config = booleanConfig[tagName];
  const value = tag ? config.valueIfTrue : config.valueIfFalse;

  return (
    <Tag color={color} key={tag}>
      {value}
    </Tag>
  );
}

export default class State extends Component {
  constructor(props) {
    super(props);
    this.state = {
      gameState: {
        playerInCombat: false,
        target: false,
      },
    };
  }

  componentDidMount() {
    const service = client.service('state');

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
  }

  render() {
    const { gameState } = this.state;

    const { playerInCombat, target } = gameState;

    console.log(gameState);

    return (
      <div>
        <BooleanTag tagName="playerInCombat" tag={playerInCombat} />
        <BooleanTag tagName="target" tag={target} />
      </div>
    );
  }
}
