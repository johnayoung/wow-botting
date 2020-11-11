/* eslint-disable react/jsx-props-no-spreading */
import React from 'react';
import _ from 'lodash';
import PropTypes from 'prop-types';
import { Card, Table } from 'antd';

import BooleanTag from '../BooleanTag';

const columns = [
  {
    title: 'Level',
    dataIndex: 'level',
    key: 'level',
    width: 100,
  },
  {
    title: 'Health',
    dataIndex: 'health',
    key: 'health',
    width: 100,
  },
  {
    title: 'Mana',
    dataIndex: 'mana',
    key: 'mana',
    width: 100,
  },
  {
    title: 'Rage',
    dataIndex: 'rage',
    key: 'rage',
  },
  {
    title: 'Energy',
    dataIndex: 'energy',
    key: 'energy',
  },
];

function Player({
  level,
  health,
  healthCurrent,
  mana,
  manaCurrent,
  energy,
  energyCurrent,
  comboPoints,
  rage,
  rageCurrent,
  playerInCombat,
}) {
  const dataSource = [
    {
      key: '1',
      level,
      health: `${healthCurrent} (${_.toNumber(health).toFixed(2)}%)`,
      mana: `${manaCurrent} (${_.toNumber(mana).toFixed(2)}%)`,
      rage: `${rageCurrent} (${_.toNumber(rage).toFixed(2)}%)`,
      energy: `${energyCurrent} (${_.toNumber(energy).toFixed(
        2
      )}%) (${comboPoints})`,
    },
  ];

  const booleanTagProps = {
    tag: playerInCombat,
    tagName: 'playerInCombat',
  };

  return (
    <Card title="Player" extra={<BooleanTag {...booleanTagProps} />}>
      <Table dataSource={dataSource} columns={columns} pagination={false} />;
    </Card>
  );
}

Player.propTypes = {
  level: PropTypes.string,
  health: PropTypes.string,
  healthCurrent: PropTypes.string,
  mana: PropTypes.string,
  manaCurrent: PropTypes.string,
  energy: PropTypes.string,
  energyCurrent: PropTypes.string,
  comboPoints: PropTypes.string,
  rage: PropTypes.string,
  rageCurrent: PropTypes.string,
  playerInCombat: PropTypes.bool,
};

Player.defaultProps = {
  level: 0,
  health: 0,
  healthCurrent: 0,
  mana: 0,
  manaCurrent: 0,
  comboPoints: 0,
  playerInCombat: false,
};

export default Player;
