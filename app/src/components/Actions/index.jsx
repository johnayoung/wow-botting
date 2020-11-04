/* eslint-disable react/prop-types */
import React from 'react';
import _ from 'lodash';
import { Button, Card, Table } from 'antd';
import client from '../../client';

import BooleanTag from '../BooleanTag';

const columns = [
  {
    title: 'Goal',
    dataIndex: 'goal',
    key: 'goal',
    width: 200,
  },
  {
    title: 'Actions',
    dataIndex: 'actions',
    key: 'actions',
    render: (actions, row, index) =>
      _.reduce(
        actions,
        (result, tag, tagName) => {
          result.push(<BooleanTag tag={tag} tagName={tagName} />);
          return result;
        },
        []
      ),
  },
];

async function changeStatus(status) {
  const service = client.service('agent');

  const config = {
    running: () => service.remove(1),
    stopped: (d) => service.create(d),
  };

  const data = {};
  return config[status](data);
}

function StartStopButton({ status }) {
  const btnText = status === 'stopped' ? 'Start Bot' : 'Stop Bot';
  const btnType = status === 'stopped' ? 'primary' : 'danger';

  return (
    <Button onClick={() => changeStatus(status)} type={btnType}>
      {btnText}
    </Button>
  );
}

export default function Actions({ status, goals }) {
  return (
    <Card title="Actions" extra={<StartStopButton status={status} />}>
      <Table
        showHeader={false}
        size="small"
        dataSource={goals}
        columns={columns}
        pagination={false}
        expandable={{ defaultExpandAllRows: true }}
      />
      ;
    </Card>
  );
}
