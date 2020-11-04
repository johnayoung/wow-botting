/* eslint-disable react/jsx-props-no-spreading */
/* eslint-disable react/prop-types */
import React from 'react';
import { Tag } from 'antd';

const booleanConfig = {
  playerInCombat: {
    text: (a) => (a ? 'IN COMBAT' : 'OUT OF COMBAT'),
    color: (a) => (a ? 'volcano' : 'green'),
  },
  target: {
    text: (a) => (a ? 'HAS A TARGET' : 'NO TARGET'),
    color: (a) => (a ? 'green' : 'volcano'),
  },
  targetIsDead: {
    text: (a) => (a ? 'TARGET DEAD' : 'TARGET ALIVE'),
    color: (a) => (a ? 'volcano' : 'green'),
  },
  castable: {
    text: (a) => (a ? 'CASTABLE' : 'NOT CASTABLE'),
    color: (a) => (a ? 'volcano' : 'green'),
  },
  equipped: {
    text: (a) => (a ? 'AVAILABLE' : 'NOT AVAILABLE'),
    color: (a) => (a ? 'volcano' : 'green'),
  },
  notEnoughMana: {
    text: (a) => (a ? 'OUT OF MANA' : 'HAVE MANA'),
    color: (a) => (a ? 'volcano' : 'green'),
  },
};

function BooleanTag({ tag, tagName }) {
  const { text, color } = booleanConfig[tagName];

  return (
    <Tag color={color(tag)} key={tag}>
      {text(tag)}
    </Tag>
  );
}

export default BooleanTag;
