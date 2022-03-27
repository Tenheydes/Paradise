import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Box, Button, Flex, Icon, Section, Slider, Table } from '../components';
import { Window } from '../layouts';

export const ChatRouting = (properties, context) => {
  const { act, data } = useBackend(context);
  const {
    channels,
  } = data;
  return (
    <Window>
      <Window.Content>
        <Table>
          <Table.Row bold textAlign="center">
            <Table.Cell colSpan="4" bold textAlign="center" pb="0.5rem" pr="1em">Windows</Table.Cell>
            <Table.Cell colSpan="4" bold textAlign="center" pb="0.5rem">Panes</Table.Cell>
          </Table.Row>
          <Table.Row textAlign="center" >
            <Table.Cell bold textAlign="center" textColor="#ffc0c0">A</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#c0ffc0">B</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#c0c0ff">C</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#c0c0c0" pr="1em">D</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#c0ffc0">A</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#c0c0ff">B</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#c0c0c0">C</Table.Cell>
            <Table.Cell bold textAlign="center" textColor="#ffffff">O</Table.Cell>
            <Table.Cell pb="0.5rem" pl="1.5rem" bold>Message Type</Table.Cell>
          </Table.Row>

          {channels.map((channel, key) => (
            <Fragment key={channel.name}>
              <Table.Row>
                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===8 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 7 })} />
                </Table.Cell>
                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===6 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 6 })} />
                </Table.Cell>
                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===5 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 5 })} />
                </Table.Cell>
                <Table.Cell textAlign="center" pl="0" pr="1em" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===4 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 4 })} />
                </Table.Cell>

                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===3 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 3 })} />
                </Table.Cell>
                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===2 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 2 })} />
                </Table.Cell>
                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===1 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 1 })} />
                </Table.Cell>
                <Table.Cell textAlign="center" px="0" mx="0">
                  <Button color="transparent" textColor="#ffffff" icon={channel.routing===0 ? "dot-circle-o" : "circle-o"} onClick={() => act("channel", { channel: channel.name, routing: 0 })} />
                </Table.Cell>
                <Table.Cell pl="1.5rem">{channel.name}</Table.Cell>
              </Table.Row>
            </Fragment>
          ))}
        </Table>
      </Window.Content>
    </Window>
  );
};
